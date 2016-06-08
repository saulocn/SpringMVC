package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {
	
	private ContaDAO contaDao;
	
	@Autowired
	public ContaController(ContaDAO contaDao) {
		this.contaDao = contaDao;
	}
	
	@RequestMapping("/form")
	public String formulario(Conta conta, Model mv) {
		if (conta.getId() != null) {
			mv.addAttribute("conta", contaDao.buscaPorId(conta.getId()));
		}
		return "conta/formulario";
	}

	@RequestMapping("/salvarConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {
		if(result.hasErrors()){
			return "conta/formulario";
		}
		
		System.out.println("Conta adicionada:" + conta.getDescricao());
		
		if (conta.getId() != null) {
			contaDao.altera(conta);
		} else {
			contaDao.adiciona(conta);
		}
		return "conta/conta-adicionada";
	}

	/*
	 * @RequestMapping("/listaContas") public ModelAndView lista() { List<Conta>
	 * contas = new ContaDAO().lista(); ModelAndView mv = new
	 * ModelAndView("conta/lista"); mv.addObject("contas", contas); return mv; }
	 */

	@RequestMapping("/listaContas")
	public String lista(Model mv) {
		mv.addAttribute("contas", contaDao.lista());
		return "conta/lista";
	}

	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		contaDao.remove(conta);
		// return "conta/delecao-ok";
		// return "forward:listaContas";
		return "redirect:listaContas";
	}
	@RequestMapping("/pagaConta")
	public void paga(Conta conta, HttpServletResponse response) {
		contaDao.paga(conta.getId());
		response.setStatus(200);
		//return "redirect:listaContas";
	}

}

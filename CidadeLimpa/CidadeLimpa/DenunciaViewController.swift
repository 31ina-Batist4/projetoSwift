//
//  DenunciaViewController.swift
//  CidadeLimpa
//
//  Created by user209392 Elina Batista on 1/7/22.
//

import UIKit

class DenunciaViewController: UIViewController {
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelEndereco: UILabel!
    @IBOutlet weak var imageViewImagem: UIImageView!
    @IBOutlet weak var textViewDescricao: UITextView!
    var denuncia:Denuncia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let formViewController = segue.destination as? FormViewController {
            formViewController.denuncia = denuncia
        }
    }

    func prepareScreen() {
        if let denuncia = denuncia {
            if let imagem = denuncia.imagem{
                imageViewImagem.image = UIImage(data: imagem)
                
            }
            labelNome.text = denuncia.nome
            labelEndereco.text = denuncia.endereco
            textViewDescricao.text = denuncia.descricao
            
        }
    }

}


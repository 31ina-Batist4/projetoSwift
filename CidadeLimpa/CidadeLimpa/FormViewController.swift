//
//  FormViewController.swift
//  CidadeLimpa
//
//  Created by user209392 on 1/8/22.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var imageViewImagem: UIImageView!
    @IBOutlet weak var textViewDescricao: UITextView!
    @IBOutlet weak var buttonAddEdit: UIButton!
    
    var denuncia: Denuncia?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let denuncia = denuncia {
          title = "Edicao"
            textFieldNome.text = denuncia.nome
            textFieldEndereco.text = denuncia.endereco
            if let imagem = denuncia.imagem {
            imageViewImagem.image = UIImage(data: imagem)
            }
            buttonAddEdit.setTitle("Alterar", for: .normal)
                    }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectImage(_ sender: UIButton) {
        let alert = UIAlertController(title: "Selecionar foto", message: "De onde voce deseja escolher a foto?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {_ in
            self.selectFoto(sourceType: .camera)
        }
        alert.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default) {_ in
            self.selectFoto(sourceType: .photoLibrary)
        }
        alert.addAction(libraryAction)
        
        let albumAction = UIAlertAction(title: "Album de fotos", style: .default) {_ in
            self.selectFoto(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func selectFoto(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if  denuncia == nil {
           denuncia = Denuncia(context: context)
        }
        denuncia?.nome = textFieldNome.text
        denuncia?.endereco = textFieldEndereco.text
        denuncia?.descricao = textViewDescricao.text
        denuncia?.imagem = imageViewImagem.image?.jpegData(compressionQuality: 0.9)
        
        try? context.save()
        
        navigationController?.popViewController(animated: true)
    }
    
}
extension FormViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imagem  = info[.originalImage] as? UIImage {
            imageViewImagem.image = imagem
        }
        dismiss(animated: true, completion: nil)
    }
}

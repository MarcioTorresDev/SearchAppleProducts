Documentação — App de Busca de Produtos Apple

🚀 Visão Geral

Aplicativo desenvolvido em Swift + UIKit + ViewCode que permite ao usuário buscar produtos da Apple, exibindo seu nome, preço e imagem. A busca é case-insensitive e aceita buscas parciais.


💼 Requisitos

Xcode: 15 ou superior

iOS: 15.0 ou superior

Swift: 5.7 ou superior

Framework: UIKit

Layout: ViewCode (Auto Layout via código)


🔍 Dados dos Produtos

let products: [String: (price: Double, imageName: String)]

Dicionário que armazena:

Nome do produto (String) como chave.

Preço (Double) e nome da imagem (String) como valor.

✅ Exemplo:

Produto

Preço

Imagem

iPhone 16 Pro

9999.90

iphone

iPad Pro

11000.00

ipad

MacBook Air

13000.00

macbook

AirPods Pro

2499.00

airpods

Magic Mouse

799.00

mouse

Magic Keyboard

999.00

keyboard

HomePod Mini

1099.00

homepod


🧐 Componentes de UI

🔹 UILabel — titleLabel

Texto: "Busca de Produtos Apple"

Fonte: Negrito, tamanho 24

Alinhamento central.

🔹 UITextField — searchTextField

Placeholder: "Digite o nome do produto"

Estilo: Borda arredondada

ReturnKey: Done

🔹 UIButton — searchButton

Título: "Buscar"

Fonte: Negrito, tamanho 18

🔹 UIImageView — productImageView

Exibe a imagem do produto.

contentMode: .scaleAspectFit

🔹 UILabel — resultLabel

Mostra o resultado da busca: Nome do Produto + Preço.


🚀 Ciclo de Vida

viewDidLoad()

Configura:

Layout (setupViews e setupConstraints).

Ações do botão buscar.

Delegate do TextField.

Gesture para fechar teclado ao tocar fora.


🛠️ Métodos

🔍 searchProduct()

Lógica da busca:

Remove espaços extras.

Faz busca case-insensitive e aceita buscas parciais.

Se encontrar:

Mostra nome e preço no resultLabel.

Carrega imagem correspondente no productImageView.

Se não encontrar:

Mostra "Produto não encontrado." e remove a imagem.

🔐 dismissKeyboard()

Fecha o teclado ao tocar fora do TextField.

⌨️ textFieldShouldReturn()

Permite acionar a busca apertando Return (Done) no teclado.

Fecha o teclado.

🎨 Layout (Auto Layout)

🔗 setupViews()

Adiciona todos os componentes (UILabel, UITextField, UIButton, UIImageView) na hierarquia da view.

📀 setupConstraints()

Define as constraints para:

Posicionamento do título no topo.

Campo de busca abaixo do título.

Botão centralizado abaixo do campo.

Imagem do produto no centro da tela, abaixo do botão.

Label de resultado abaixo da imagem.


💼 Estrutura de Pastas Sugerida

├── App
│   ├── SceneDelegate.swift
│   ├── AppDelegate.swift
│
├── ViewControllers
│   └── ViewController.swift
│
├── Resources
│   └── Assets.xcassets
│
└── Documentation
    └── Documentacao.md
    

🎯 Guia de Instalação

Clone o repositório:

git clone https://github.com/seuusuario/nome-do-repositorio.git

Abra o arquivo .xcodeproj no Xcode.

Conecte um simulador ou dispositivo.

Clique em Run (▶) para executar.


🚀 Funcionalidades Implementadas

🔍 Busca inteligente (ignora maiúsculas e minúsculas).

🌤️ Aceita buscas parciais.

🎨 Layout 100% em ViewCode.

💪 Fechamento de teclado ao tocar fora ou apertar Return.

🖼️ Exibição dinâmica de imagens e informações dos produtos.

🚀 Melhorias Futuras Sugeridas

✅ Lista de produtos (UITableView ou UICollectionView).

✅ Tela de detalhes do produto.

✅ Animações e transições.

✅ Persistência de dados (UserDefaults, CoreData ou Firebase).

✅ Histórico de buscas recentes.


🚫 Licença

Este projeto é de uso pessoal/educacional. Caso deseje, pode adicionar uma licença como MIT, GPL, entre outras, dependendo do objetivo de distribuição do aplicativo.

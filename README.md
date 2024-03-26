<h1>Zee now API</h1>

Esse projeto é uma API feita em Ruby on Rails capaz de cadastrar, atualizar, listar e deletar dados de produtos, incluindo a gestão de SKUs associados a esses produtos.

<h1>Tecnologias utilizadas;</h1>

- Ruby 2.7.1
- Rails 6.1.7
- PostgreSQL

<h2>Bibliotecas utilizadas;</h2>

- rack-cors: É uma biblioteca Ruby que fornece suporte para Cross-Origin Resource Sharing (CORS) em aplicações Rack.
- devise: É uma biblioteca Ruby on Rails para autenticação de usuários.
- devise-jwt: É uma extensão do Devise para adicionar suporte a autenticação JWT (JSON Web Tokens).
- jsonapi-serializer: É uma ferramenta para serialização de objetos Ruby em conformidade com o formato JSON:API. JSON:API.
- rspec-rails: É uma estrutura de teste para Ruby que facilita a escrita de especificações para código Ruby.

<h2>Modo de utilizar;</h2>

- Clone este repositório.
- Abre o prompt e entre no diretório deste repositório, execute o comando `bundle install` para instalar as dependências.
- Renomeie o arquivo database.yml.example para database.yml e configure o banco conforme as credenciais do seu banco.
- No prompt execute os comandos: `rails db:create` e `rails db:migrate`
- Para subir o projeto, no prompt execute o seguinte comando: `rails s`
- Logo após, utilize uma ferramenta de sua preferência de requisição de API, exemplos: Postman, Insomnia e etc.

Abra a ferramenta (utilizado o Insomnia). De primeiro momento crie o seu usuário

<h4>REQUISIÇÕES USUÁRIO</h4>

- URL: POST http://localhost:3000/signup
- Corpo da Requisição:
```json
{
  "user": {
    "email": "exemplo@test.com",
    "password": "123456"
  }
}
```
- Resposta de Sucesso: Status 200 OK

Faça o Login
- URL POST http://localhost:3000/login
- Corpo da Requisição:
```json
{
  "user": {
    "email": "exemplo@test.com",
    "password": "123456"
  }
}
```
- Resposta de Sucesso: Status 200 OK

Após logar, vá em Headers e copie o valor de Authorization(Token).

Para as proximas requisições é necessário inserir o token gerado, siga os passos: 

- Clique em Auth Types e selecione a opção `Bearer Token`, em token copie o valor de Authorization(Token) sem o Bearer do começo.

Com isso, podemos fazer as requisições para os produtos.

<h4>REQUISIÇÕES PRODUTOS</h4>

Para criar um novo produto
- URL: POST http://localhost:3000/products/
- Corpo da Requisição:
```json
{
  "product": {
    "slug": "exemplo-produto",
    "name": "produto",
    "description": "descrição produto",
    "manufacturer": "fabricante",
    "active": true,
    "skus_attributes": [
      {
        "code": "0001",
        "name": "exemplo sku",
        "stock": 1,
        "table_price": 50,
        "listing_price": 45
      }
    ]
  }
}
```
- Resposta de Sucesso: Status 201 Created
- Pode se criar apenas o produto e também apenas um sku ou até vários skus para o produto.

Para atualizar um produto
- URL: PATCH http://localhost:3000/products/:id
- Corpo da Requisição:
```json
{
  "product": {
    "slug": "exemplo-produto-editado",
    "name": "produto",
    "description": "descrição produto",
    "manufacturer": "fabricante",
    "active": true
  }
}
```
- Resposta de Sucesso: Status 200 OK

Para listar todos os produtos
- URL: GET http://localhost:3000/products/
- Resposta de Sucesso: Status 200 OK

Para listar um produto
- URL: GET http://localhost:3000/products/:id
- Resposta de Sucesso: Status 200 OK

Para deletar um produto
- URL: DELETE http://localhost:3000/products/:id
- Resposta de Sucesso: Status 204 No Content

<h4>REQUISIÇÕES SKUS</h4>

Para editar um sku

- URL: GET http://localhost:3000/products/:product_id/skus/:id
- Corpo da requisição
```json
{
  "sku": {
		"product_id": 1,
		"code": "0002",
		"name": "exemplo sku",
		"stock": 1,
		"table_price": 50,
		"listing_price": 45
  }
}
```
- Resposta de Sucesso: Status 200 OK

Para listar skus de um produto
- URL: GET http://localhost:3000/products/:product_id/skus/
- Resposta de Sucesso: Status 200 OK

Para listar um sku
- URL: GET http://localhost:3000/products/:product_id/skus/:id
- Resposta de Sucesso: Status 200 OK

Para deletar um sku
- URL: DELETE http://localhost:3000/products/:product_id/skus/:id
- Resposta de Sucesso: Status 204 No Content

E esse é o projeto Zee now API, dúvidas ou para maiores informações, entre em contato!
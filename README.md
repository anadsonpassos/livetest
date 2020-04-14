# TesteLiveQuarentena

## Running

### Como executar o projeto

* Importante ter o Ruby instalado

### Instalar o Bundler
`
gem install bundler
`

### Instalar as dependências do Ruby (projeto)
`
bundle install
`

### Executar localmente (minha máquina)
`
cucumber -p <store_id> -p hom
cucumber -p americanas -p hom -t @regressao
`

### Executar no servidor CI (gerando reports JSON)
`
cucumber -p <store_id> -p ci
cucumber -p americanas -p ci -t @regressao_ci
`

### Executar localmente (minha máquina)
`
cucumber -p <store_id> -p dev
cucumber -p americanas -p dev -t @regressao
`

Onde store_id deve ser substituído por o nome da loja em caixa baixa para que seja utilizado o perfil daquela loja. Esse perfil está definido no arquivo cucumber.yml.
Exemplo:

cucumber -p americanas -p dev

`-p dev` para executar no ambiente de Desenvolvimento

`-p hom` para executar no ambiente de Homologação

`-p ci` para executar no ambiente de CI/CD - docker

Tags

Pode-se executar apenas cenários que contém tags específicas, testando assim funcionalidades isoladas ou testes isolados.

As tags disponíveis são:

@positivo

@negativo

@regressao

@americanas
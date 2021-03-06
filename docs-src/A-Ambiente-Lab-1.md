# Lab 1: Configurando github

Devemos começar a preparar o terreno para os projetos em grupo que estarão por vir, nessa etapa vocês devem montar um grupo de 5/6 colegas e dar um nome a ele (os grupos são nomeados por letras, a primeira letra do nome do seu grupo será fornecida pelo professor).

O grupo irá trabalhar de forma colaborativa via a utilização do git/ github. É imprescindível que todos trabalhem dessa forma, pois será a maneira que iremos avaliar individualmente vocês. 

## Criando o grupo

Grupo de até 6 pessoas! Preencher o form a seguir...

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScaBsuqSTAZhwr1B8WFR5-LVSUO37P75_a2YfhS-qGecUQXMg/viewform?embedded=true" width="640" height="320" frameborder="0" marginheight="0" marginwidth="0">Loading…</iframe>


## GitHub

O git será uma das ferramentas mais importantes para o projeto, com as etapas a seguir vocês realizaram um [Fork](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow) do repositório do projeto e adicionaram os colaboradores.

### Fork

!!! warning "Um por grupo"
    Daqui até o próximo aviso só uma pessoa do grupo deve fazer! Os demais devem acompanhar.

O [Scrum Master](https://www.scrum.org/resources/what-is-a-scrum-master) do grupo (será sorteado em sala) deverá realizar o [fork](https://help.github.com/articles/fork-a-repo/) do repositório do projeto do computador Z01, para isso, basta acessar a página do github do projeto:

- [`https://github.com/Insper/Z01.1`](https://github.com/Insper/Z01.1)

E no site clicar em **fork**:

![Fork](figs/A-Transistores/A-Ferramental-github-fork.png)

Note que criar um **fork** é diferente de criar apenas uma cópia. No **fork** o seu repositório ainda possui como referência o original (/insper/Z01.1) o que possibilitará que vocês atualizem o repositório com novos materiais que serão necessários ao longo do semestre sem perder o que já foi feito e mais importante sem muito trabalho.

!!! tip "git"
    `fork` não existe no git, é algo implementado pelo github (e similares). É utilizado para criar uma 'cópia' de um repositório para podermos trabalhar nele sem a necessidade de mexermos no original.

### Alterando o nome do Fork

Acesse a página do repositório de vocês no :arrow_right: `github` :arrow_right: `SETTINGS` :arrow_right:  `Repository Name` :arrow_down: e altere o nome do repositório para:

- `nome`:  **Z01.1-NomeDoGrupo**

!!! tip "NomeDoGrupo"
    O Nome do grupo deve ser uma palavra que começe com a letra que o grupo recebeu...

### Colaboradores

Isso irá criar uma cópia do repositório na sua conta, uma vez realizado a cópia será necessário inserir os demais colegas como integrantes desse repositório (para que eles possam propor alterações). Para isso vá até a página do repositório na sua conta e clique em `Settings` :arrow_right: `Collaborators` e adicione os usuários ou e-mails dos seus colegas. 

!!! note ""
    :point_right: Todos integrantes do grupo já devem ter uma conta no github já criada.

![Collaborators](figs/A-Transistores/A-Ferramental-github-collaborators.png)

### Ferramentas github

!!! tip "git"
    GitHub Inc. is a web-based hosting service for version control using Git. It is mostly used for computer code. It offers all of the distributed version control and source code management functionality of Git as well as adding its own features. [Wikipedia](https://en.wikipedia.org/wiki/GitHub)
    
    - [http://github.com](http://github.com)

Nessa disciplina iremos utilizar não só a ferramenta principal do github, que é o servidor de repositórios git, mas todas as outras ferramentas já integradas na plataforma para gestão e acompanhamento de projeto. Para isso será alteramos algumas configurações no repositório:

!!! example "Execute"
    Na página do seu repositório vá em: `Settings` :arrow_right: `Features` :arrow_right: e ative `Issues ` e `Project`.

??? tip "Ferramentas github"
    - **Github Project**: Ferramenta do github para gerenciamento de projetos (estilo Kambam), cada repositório pode ter N projetos, e o github automatiza o processo de todo/doing/done deixando de maneira visual as tarefas.

    - **github issues**: Plataforma do github para criação de tarefas/ reportar erros. As tarefas aqui criadas serão associadas a um projeto específico e a um grupo de pessoas específicas.

    - **Branch**: Ramo criado para implementar um feature/ correção de bug que será futuramente incorporado no master (merge)

    - **Master**: Ramo principal do projeto, gerenciado pelo Scrum Master

    - **Pull-request**: Maneira de um lider de projeto receber alterações a um projeto e ter controle do que será aceito ou não. Na maioria dos casos o pull-request é criado por um usuário e revisado por outro. Quem for fazer a eletiva de [`Desenvolvimento Aberto`](https://igordsm.github.io/dev-aberto/aulas.html) do [Prof. Igor](https://github.com/igordsm) verá bem a fundo essa questão. 


## Travis CI

Travis é um sistema de integração contínua que vai executar de forma automática alguns testes (criado por nós) no projeto e em caso de alguma falha irá notificar no github e por e-mail todos os integrantes.

Como ele funciona ? Ele fica verificando o repositório por alterações (você deve além de dar commit, dar push) e para cada novo commit ele faz o seguinte

1. Inicializa uma nova máquina virtual na nuvem (ubuntu, windows, mac)
2. Instala todo a infra necessária do projeto (no caso do Z01.1 : python, java, Quartus, ...)
3. Executa os scripts de teste localizados em cada projeto.
4. Desliga e "deleta" a máquina virtual recém criada.

O arquivo de configuração do travis está localizado na raiz do repositório: [`Z01.1/.travis.yml`](https://github.com/Insper/Z01.1/blob/master/.travis.yml). Nele que estão feitas todas as definições de execução.

Na pagina do seu repositório em commits deve aparecer uma pequena bolinha em cada um dos commits novos que serão feitos no projeto, esse indicador será atualizado pelo travis sendo:

- Amarelo: O teste está em execução
- Verde: O teste passou
- Vermelho: O teste falhou

!!! note
    Cada teste leva em torno de alguns minutos já que toda a infraestrutura é instalada sempre do zero, não utilize o sistema de Integração Contínua para validar as suas novas implementações, esse sistema deve ser utilizado para encontrar problemas mais amplos ou para o scrum master aceitar ou não um pull-request, já que o resultado do sucesso ou não dessa requisição é visível facilmente.

## Ativando o Travis

!!! warning "Somente o `owner` do repositório"
    Daqui até o próximo aviso só uma pessoa do grupo deve fazer! Os demais devem acompanhar.

Será necessário acessar o site do travis:

- [https://travis-ci.org/](https://travis-ci.org/) e adicione o projeto forkado ao travis:

![Travis](figs/C-LogiComb/C-config-travis.gif)


### Arquivo GRUPO.json de configuração 

!!! warning "Um por grupo"
    Somente um do grupo deve realizar isso.

Após clonar o repositório o mediador desse projeto deve editar o arquivo json `GRUPO.json` que está localizado na raiz do projeto inserindo a letra do grupo (que foi atribuída em sala) e o nome recém criado do grupo (o nome do grupo deve ser uma Frase com a primeira palavra começando com a letra do Grupo).

Exemplo um grupo com a letra **M**, `GRUPO.json`:

```json
{
  "Nome-Grupo" : "Macarrao" 
}
```

Após editar o arquivo deve-se: fazer um `commit` e um `push` para o repositório. 

```bash
$ git commit -am "update Grupo"
$ git push origin master
```

## Slack

O [Slack](https://slack.com/intl/pt-br/) é uma ferramenta de conversa similar ao discord porém para uso de empresas (e não para jogos =/). Termos um canal da disciplina no Slack, **e todos devem participar**, para isso basta acessar o link a seguir:

https://join.slack.com/t/z01-2020/shared_invite/enQtOTQ2MjMwNzUyNjc4LWNmMGQzMTdhYzRlZmE5NDI1ODYyZWQzOTcwYTdmNjM2ZDNlODAwYTJiNWZjMDc4OTI0ZDMxZDg1NjU4MGNhYzE

!!! note
    Como nome de usuário colocar seu Nome e Sobrenome
    
## Canal do grupo

!!! warning "Um por grupo"
    Somente um do grupo deve realizar isso.
    
Cada grupo deve ter um canal privado no slack, na qual todos fazer parte e o seus professores também (Rafael Corsi, Eduardo Marossi). O canal deve ser o nome do grupo!



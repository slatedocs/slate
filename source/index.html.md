---
title: Focus NFe API v2

language_tabs: # must be one of https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers
  - shell
  - php
  - java
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='https://forum.focusnfe.com.br/' target='_blank'>Fórum Focus NFe</a>

includes:
  - nfe
  - nfce
  - comunicador-focus-nfe
  - nfse
  - lote_rps
  - nfses-recebidas
  - cte
  - mdfe
  - manifestacao
  - manifestacao-cte
  - backups
  - webhooks
  - email
  - ncm
  - cfop
  - cep
  - cnae
  - municipios
  - cnpjs
  - empresas
  - limite-requisicoes
  - github

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentação da API REST Focus NFe para emissão de Documentos Fiscais (NFe, NFSe, NFCe, CTe e MDFe)

---


# Introdução

<aside>
Esta é a documentação da API para a versão mais recente (v2).
</aside>

A API da Focus NFe permite que você emita ou consulte documentos fiscais (NFe, NFSe, NFCe) a partir do seu sistema, seja qual for a tecnologia que ele utilize através da geração de dados em um formato simplificado, sem a necessidade de gerar a assinatura digital destes documentos. A API ainda gerencia toda a comunicação com os servidores da SEFAZ de cada estado ou com os servidores da prefeitura, no caso de NFSe.

Através desta documentação deverá ser possível fazer a integração com a API da Focus NFe, caso alguma dúvida permaneça você pode entrar em contato com o suporte especializado através do e-mail suporte@focusnfe.com.br.


## Como ler este documento?

Você deverá ler primeiramente a introdução, em seguida, a seção sobre o documento que você irá emitir ([NFe](#nfe), [NFCe](#nfce) ou [NFSe](#nfse)).

Caso você emita NFe ou NFCe, você deverá ler também sobre os [backups](#backups-nfe-nfce-e-cte).

Caso você emita NFe ou NFSe, você poderá ler também sobre os [gatilhos e webhooks](#gatilhos-webhooks). O uso de gatilhos no sistema é opcional.

Caso você tenha interesse em obter as notas emitidas contra a sua empresa, leia a seção de [manifestação](#manifestacao-nfe).

Se sua empresa irá administrar vários clientes que emitem notas, pode ser interessante você ler sobre a seção de [empresas](#empresas).


## Qual documento fiscal você precisa emitir?

Dependendo da atividade da sua empresa você deverá emitir um ou mais destes documentos que irão representar frente ao governo qualquer operação com mercadoria ou serviços:

* NFe - Nota Fiscal Eletrônica. Utilizado para indústrias, distribuidores em geral ou empresas que vendem para clientes fora de seu estado. Neste caso é aceitável uma nota demorar vários minutos para ser autorizada. Existe um padrão nacional. O documento é de competência do estado.
* NFCe - Nota Fiscal ao Consumidor Eletrônica. Utilizado para empresas de varejo, que trabalham diretamente com o consumidor final. Neste caso há a preocupação da nota ser emitida em poucos segundos. Existe um padrão nacional. O documento é de competência do estado.
* NFSe - Nota Fiscal de Serviços Eletrônica. Utilizado para a maioria dos prestadores de serviços. É aceitável a nota demorar vários minutos para ser autorizada. Esta nota é de competência da prefeitura. Existe uma recomendação nacional que cada prefeitura implementa como bem entender.
* CTe - Conhecimento de Transporte Eletrônico. Usado para prestadores de serviços de transporte. Existe um padrão nacional. Documento de competência do estado.

Existe algumas exceções no país, por exemplo Brasília pode utilizar NFe para serviços e Manaus utiliza NFCe em alguns casos para notas de serviços. Na dúvida, consulte o contador da sua empresa.


## Visão geral do processo de emissão de um documento

A emissão de NFe e NFSe são processadas de forma **assíncrona**. NFCe é processada de forma **síncrona**.

A emissão de documentos síncronos (NFCe) é simples:

1. Você envia pela API os dados do documento
2. A API devolve como resposta da requisição se o documento foi emitido ou não, e qual a mensagem de erro

Já a emissão de documentos de forma assíncrona são feitos da seguinte forma:

1. Você envia pela API os dados do documento
2. A API faz uma primeira validação do formato dos dados. Se houver alguma inconsistência, é devolvida uma mensagem de erro. Se estiver tudo ok, o documento é **aceito para processamento posterior**. Ou seja, ele vai para uma fila onde será eventualmente processado.
3. Sua aplicação irá fazer uma nova consulta para verificar o status do processamento
4. Nossa API irá informar se o documento ainda está sendo processado, ou se o processamento já finalizou. Neste último caso informa a mensagem de erro ou os dados do documento gerado caso a nota tenha sido autorizada.
5. Caso o documento ainda esteja em processamento, sua aplicação deverá agendar uma nova consulta dentro de alguns segundos.

Alternativamente, você poderá usar o conceito de [gatilhos/webhooks](#gatilhos-webhooks). Neste caso você informa a API qual endereço de sua aplicação deverá ser chamado quando uma nota for autorizada. Neste caso funcionaria assim:

1. Você envia pela API os dados do documento
2. A API faz uma primeira validação do formato dos dados. Informa sobre inconsistência ou avisa que a nota foi aceita para processamento, como no cenário anterior.
3. Quando a nota for processada, a API irá ativamente lhe informar através de um HTTP POST no endereço combinado o resultado do processamento.


## Autenticação

A autenticação é feita através de um token. Ao habilitar a API para sua empresa forneceremos uma string secreta e única que será usada para efetuar todas as operações. A autenticação poderá ser feita usando o método HTTP Basic Auth (saiba mais em [https://en.wikipedia.org/wiki/Basic_access_authentication](https://en.wikipedia.org/wiki/Basic_access_authentication)) fornecendo o token como nome de usuário e deixando a senha em branco.

Caso não seja possível utilizar método HTTP Basic Auth você pode também enviar sempre o parâmetro “token” informando o seu token de acesso. Porém nós recomendamos o uso de HTTP Basic Auth pois isto aumenta a segurança impedindo a gravação do token em históricos do navegador, logs de acesso, etc.


## Referência

A referência é a forma que utilizamos para identificar a sua emissão em nossa API, por isso, ela deve ser única para cada token de acesso que você receba. A referência pode ser alfanumérica, contudo, não são permitidos caracteres especiais. É comum a utilização do identificador da tabela em banco de dados que representa uma nota fiscal no seu sistema.

Uma referência pode ser reutilizada caso ocorra erro na autorização. Mas uma vez que a nota seja autorizada (mesmo que posteriormente cancelada), a referência usada não poderá mais ser usada em outro envio.


## Ambiente

A API do Focus NFe oferece dois ambientes para emissão de notas: homologação e produção.

**Homologação**

O ambiente de homologação serve para envio de notas fiscais com a finalidade de teste. As notas emitidas aqui não possuem validade fiscal/tributária.

**Produção**

Este é o ambiente com validade fiscal e tributária, pois isso, recomendamos que utilize este ambiente apenas quando for iniciar o processo de envio de notas válidas.

O endereço dos servidores são os seguintes:

Homologação: `https://homologacao.focusnfe.com.br`

Produção: `https://api.focusnfe.com.br`

**Considerações sobre o uso de SSL**

```php
<?php
# Em PHP normalmente é necessária uma configuração adicional.
# Em muitos sites você irá encontrar a solução abaixo,
# para ignorar a validação do certificado:

$ch = curl_init();
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

# Porém o correto seria indicar para confiar na unidade certificadora
$ch = curl_init();
curl_setopt($ch, CURLOPT_CAINFO, "/pasta/no/servidor/ca.crt");
?>

```

Verifique em sua linguagem de programação se é necessário alguma configuração adicional para uso de SSL.
Pode ser necessário indicar explicitamente a confiar na autoridade certificadora que emitiu o certificado SSL.
Em especial na linguagem Java é necessário adicionar todos os certificados, inclusive de toda cadeia da empresa
certificadora.

Para poder baixar os certificados de nosso servidor, você pode executar o seguinte comando em algum
console linux:

  `openssl s_client -showcerts -connect api.focusnfe.com.br:443`

Isto irá listar todos os certificados entre "`-----BEGIN CERTIFICATE-----`"
e "`-----END CERTIFICATE-----`". Apenas salve todos estes certificados em arquivos separados e importe
para a sua ferramenta de armazenamento de certificados. Entre em contato com nosso suporte caso encontre
problemas neste processo.


## Padrão REST

A API utiliza o padrão de arquitetura REST [https://pt.wikipedia.org/wiki/REST](https://pt.wikipedia.org/wiki/REST). Neste padrão, são utilizados verbos ou métodos HTTP (GET, POST, DELETE) em conjunto com determinados recursos disponíveis através de uma URL para representar uma determinada ação. Por exemplo, o verbo GET é usado para representar algum tipo de visualização dos dados de um dado recurso, e o verbo POST é usado para criar um novo recurso e o verbo DELETE representa uma exclusão.

Abaixo alguns exemplos de requisições:

Método | URL (recurso) | Ação
------ | ------------- | --------------
POST |  /v2/nfe?ref=REFERENCIA | Cria uma nota fiscal e a envia para processamento.
GET | /v2/nfe/REFERENCIA | Consulta a nota fiscal com a referência informada e o seu status de processamento
DELETE | /v2/nfe/REFERENCIA | Cancela uma nota fiscal com a referência informada

<aside class="notice">
Você deve substituir <code>REFERENCIA</code> pela referência gerada pela sua aplicação.
</aside>

A API utiliza o formato JSON para transferência de dados.

Sempre que é feita uma chamada HTTP é devolvido um código de retorno. Este código irá informar também se a requisição foi aceita ou se ocorreu algum erro, da seguinte forma:

* Códigos que iniciam com “2” representam ação que foi completada com sucesso, por exemplo: 200, 201.
* Códigos que inicial com “4” ou "5" representam algum erro na requisição, por exemplo: 404, 402, etc.


Abaixo listamos os códigos HTTP que nossa API pode devolver:

Código HTTP | Significado | Explicação
------ | ------------- | --------------
200 | Ok | Este código é devolvido quando uma consulta resulta em sucesso.
201 | Criado | Este código é devolvido quando uma requisição é aceita para processamento.
400 | Requisição inválida | Este erro é devolvido quando falta alguma informação na requisição ou ela é inválida por algum outro motivo. Por exemplo quando falta algum parâmetro obrigatório.
403 | Permissão negada | Este erro é devolvido quando ocorre algum problema de permissão envolvendo o token de acesso.
404 | Não encontrado | Este erro é devolvido quando não é encontrado algum recurso que é pesquisado.
415 | Mídia inválida | Este erro é devolvido quando não é reconhecido o formato JSON enviado, devido a alguma falha de sintaxe.
422 | Entidade improcessável | Não existe erro na requisição (sintaxe), porém há algum erro de semântica (por exemplo, tentar cancelar uma nota já cancelada)
429 | Muitas requisições | Você ultrapassou o limite de requisições por minuto. Veja o [limite de requisições](#limite-de-requisicoes)
500 | Erro interno do servidor | Ocorreu algum erro inesperado. Contate o suporte técnico.

Note que se o código HTTP devolvido for de sucesso não implica que uma nota tenha sido autorizada com sucesso. Por exemplo, você pode enviar uma nota fiscal para autorização, nossa API devolver o status 201 (criado) (pois não havia nenhum erro aparente na nota fiscal) porém ao ser processada pela SEFAZ ou prefeitura verificou-se que a data de emissão estava muito atrasada. Ou seja, os códigos HTTP são utilizados para verificar se a transação está ok no nível de comunicação da sua aplicação com a nossa API (e não com o SEFAZ).


## Erros

> Exemplo de mensagem de erro

```json
{
  "codigo": "nao_encontrado",
  "mensagem": "Nota fiscal não encontrada"
}
```
As mensagens de erro serão apresentadas em qualquer operação sempre que for devolvido um código HTTP que começa com 4. A mensagem será um objeto com os seguintes atributos:

* **codigo** - O código da mensagem
* **mensagem** - A descrição mais detalhada do que ocorreu
* **erros** - (Opcional) Quando for possível detalhar o erro, ele será informado neste array de objetos

Abaixo listamos os códigos de erro mais comuns.

Código HTTP | Código do erro | Significado
|-----------|-------|------------
400 | requisicao_invalida | Faltou informar algum campo na requisição. Este campo é informando na mensagem do erro
400 | empresa_nao_habilitada | Empresa ainda não habilitada para emitir o documento que você precisa. Habilite no seu painel ou contate o suporte técnico
400 | nfe_cancelada | Foi feita uma tentativa de cancelar uma nota já cancelada
403 | permissao_negada | Sua aplicação por algum motivo se encontra bloqueada para uso. Contate o nosso suporte
404 | nao_encontrado | Ocorre quando o recurso que você está procurando (NFe, NFCe ou NFSe) não é encontrado
422 | nfe_nao_autorizada | Foi feita alguma operação com a nota que só é aplicável se ela estiver autorizada (por exemplo a ação de cancelamento)
422 | nfe_autorizada | Foi solicitado o processamento de uma nota já autorizada
422 | em_processamento | Foi solicitado o processamento de uma nota que já está em processamento

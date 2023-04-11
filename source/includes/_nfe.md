# NFe

Através da API NFe é possível:

* Emitir NFe utilizando dados simplificados. Este processo por default é **assíncrono**. Ou seja, após a emissão a nota será enfileirada para processamento. Em alguns estados é possível configurar a emissão para envio **síncrono** quando possível.
* Cancelar NFe.
* Consultar o status de NFe emitidas.
* Encaminhar uma NFe por email
* Emitir Carta de Correção.
* Inutilizar uma faixa de numeração de NFe

## URLs


Método | URL (recurso) | Ação
-------|-------|-----
POST |  /v2/nfe?ref=REFERENCIA  | Cria uma nota fiscal e a envia para processamento.
GET  | /v2/nfe/REFERENCIA | Consulta a nota fiscal com a referência informada e o seu status de processamento
DELETE |  /v2/nfe/REFERENCIA  | Cancela uma nota fiscal com a referência informada
POST |  /v2/nfe/REFERENCIA/carta_correcao | Cria uma carta de correção para a nota fiscal com a referência informada.
POST |  /v2/nfe/REFERENCIA/email  | Envia um email com uma cópia da nota fiscal com a referência informada
POST |  /v2/nfe/inutilizacao  | Inutiliza uma numeração da nota fiscal
POST |  /v2/nfe/importacao?ref=REFERENCIA | Cria uma nota fiscal a partir da importação de um XML

## Campos obrigatórios de uma NFe

Atualmente, a NFe possui centenas de campos para os mais variados tipos e formas de operações, por isso, criamos uma página exclusiva que mostra todos os campos da nossa API para o envio de NFe. Nela, você pode buscar os campos pela TAG XML ou pela nossa tradução para API.

[Documentação completa dos campos (versão 4.00 da NFe)](https://campos.focusnfe.com.br/nfe/NotaFiscalXML.html)

Abaixo, iremos mostrar os campos de uso obrigatório para emissão de uma Nota Fiscal Eletrônica.

>> Abaixo um exemplo de dados de uma nota (usando a versão 4.00 da NFe):

```json
{
  "natureza_operacao":"Remessa",
  "data_emissao":"2017-04-15",
  "data_entrada_saida":"2017-04-15",
  "tipo_documento":1,
  "finalidade_emissao":1,
  "cnpj_emitente":"SEU_CNPJ",
  "cpf_emitente": "SEU_CPF",
  "nome_emitente":"Sua Raz\u00e3o Social Ltda",
  "nome_fantasia_emitente":"Fantasia do Emitente",
  "logradouro_emitente":"Rua Quinze de Abril",
  "numero_emitente":999,
  "bairro_emitente":"Jd Paulistano",
  "municipio_emitente":"S\u00e3o Paulo",
  "uf_emitente":"SP",
  "cep_emitente":"01454-600",
  "inscricao_estadual_emitente":"SUA_INSCRICAO_ESTADUAL",
  "nome_destinatario":"NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "cpf_destinatario":"03055054911",
  "inscricao_estadual_destinatario":null,
  "telefone_destinatario":1196185555,
  "logradouro_destinatario":"Rua S\u00e3o Janu\u00e1rio",
  "numero_destinatario":99,
  "bairro_destinatario":"Crespo",
  "municipio_destinatario":"Manaus",
  "uf_destinatario":"AM",
  "pais_destinatario":"Brasil",
  "cep_destinatario":69073178,
  "valor_frete":0.0,
  "valor_seguro":0,
  "valor_total":47.23,
  "valor_produtos":47.23,
  "modalidade_frete":0,
  "items": [
    {
      "numero_item":1,
      "codigo_produto":1232,
      "descricao":"Cartu00f5es de Visita",
      "cfop":5923,
      "unidade_comercial":"un",
      "quantidade_comercial":100,
      "valor_unitario_comercial":0.4723,
      "valor_unitario_tributavel":0.4723,
      "unidade_tributavel":"un",
      "codigo_ncm":49111090,
      "quantidade_tributavel":100,
      "valor_bruto":47.23,
      "icms_situacao_tributaria":41,
      "icms_origem":0,
      "pis_situacao_tributaria":"07",
      "cofins_situacao_tributaria":"07"
    }
  ]
}
```

### Geral

* <strong>natureza_operacao</strong>: Descrição da natureza da operação a ser realizada pela nota fiscal.
* <strong>data_emissao</strong>: Data da emissão da NFe. Formato padrão ISO, exemplo: “2016-12-25T12:00-0300”.
* <strong>tipo_documento</strong>: Tipo da NFe. Valores possíveis:

0 – Nota Fiscal de Entrada;

1 – Nota Fiscal de Saída.

* <strong>local_destino</strong>: Local onde a operação irá acontecer. Valores possíveis:

1 – Operação interna;

2 – Operação interestadual;

3 – Operação com exterior.

* <strong>finalidade_emissao</strong>: Indicar qual a finalidade da emissão da nota. Valores possíveis:

1 – Normal;

2 – Complementar;

3 – Nota de ajuste;

4 – Devolução.

* <strong>consumidor_final</strong>: Indicar se a operação é com consumidor final. Valores possíveis:

0 – Normal;

1 – Consumidor final.

* <strong>presenca_comprador</strong>: Informar como foi a presença do comprador. Valores possíveis:

0 – Não se aplica (por exemplo, para a Nota Fiscal complementar ou de ajuste);

1 – Operação presencial;

2 – Operação não presencial, pela Internet;

3 – Operação não presencial, Teleatendimento;

4 – NFC-e em operação com entrega em domicílio;

9 – Operação não presencial, outros.

### Emitente

* <strong>cnpj_emitente</strong>: CNPJ do emitente da nota. Deve ser usado esse campo ou o "cpf_emitente".
* <strong>cpf_emitente</strong>: CPF do emitente da nota. Deve ser usado esse campo ou o "cnpj_emitente".
* <strong>inscricao_estadual_emitente</strong>: Informar a Inscrição Estadual do emitente.
* <strong>logradouro_emitente</strong>: Logradouro do emitente.
* <strong>numero_emitente</strong>: Número do logradouro do emitente.
* <strong>bairro_emitente</strong>: Bairro do emitente.
* <strong>municipio_emitente</strong>: Município do emitente.
* <strong>uf_emitente</strong>: UF do emitente.
* <strong>regime_tributario_emitente</strong>: Informar qual o regime tributário do emitente. Valores possíveis:

1 – Simples Nacional;

2 – Simples Nacional – excesso de sublimite de receita bruta;

3 – Regime Normal.

### Destinatário
* <strong>nome_destinatario</strong>: Nome completo do destinatário.
* <strong>cnpj_destinatario</strong>: CNPJ da empresa destinatária.
* <strong>cpf_destinatario</strong>: CPF do destinatário. Caso utilize este campo, não enviar o campo “cnpf_destinatario”.
* <strong>inscricao_estadual_destinatario</strong>: Informar a Inscrição Estadual do destinatário.
* <strong>logradouro_destinatario</strong>: Logradouro do destinatário.
* <strong>numero_destinatario</strong>: Número do logradouro do destinatário.
* <strong>bairro_destinatario</strong>: Bairro do destinatário.
* <strong>municipio_destinatario</strong>: Município do destinatário.
* <strong>uf_destinatario</strong>: UF do destinatário.
* <strong>indicador_inscricao_estadual_destinatario</strong>: Indicador da Inscrição Estadual do destinatário. Valores possíveis:

1 – Contribuinte ICMS (informar a IE do destinatário);

2 – Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS;

9 – Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS.

### Itens
Uma NFe irá conter um ou mais itens no campo “items” que poderão conter os campos abaixo:

* <strong>numero_item</strong>: Numeração que indica qual a posição do item na nota, deve ser usado numeração sequencial a partir do número “1”.
* <strong>codigo_produto</strong>: Código do produto.
* <strong>descricao</strong>: Descrição do produto.
* <strong>cfop</strong>: Código Fiscal da Operação, CFOP da operação válido para NFe.
* <strong>quantidade_comercial</strong>: Quantidade da mercadoria.
* <strong>quantidade_tributavel</strong>: Quantidade tributavel da mercadoria. Caso não se aplique, utilize o mesmo valor do campo quantidade_comercial.
* <strong>valor_unitario_comercial</strong>: Valor unitário da mercadoria.
* <strong>valor_unitario_tributavel</strong>: Valor unitário tributável da mercadoria. Caso não se aplique, utilize o mesmo valor do campo valor_unitario_comercial.
* <strong>unidade_comercial</strong>: Unidade comercial do produto. Você pode utilizar valores como “KG”, “L”, “UN” entre outros. * Caso não se aplique, use “UN”.
* <strong>unidade_tributavel</strong>: Unidade tributável do produto. Caso não se aplique, utilize o mesmo valor do campo unidade_comercial.
* <strong>valor_bruto</strong>: Valor bruto do produto.
* <strong>código_ncm</strong>: Código NCM do produto. Este código possui 8 dígitos.
* <strong>inclui_no_total</strong>: Valor do item (valor_bruto) compõe valor total da NFe (valor_produtos)?. Valores possíveis:

0 – Não;

1 – Sim.

* <strong>icms_origem</strong>: Informar a origem do ICMS. Valores possíveis:

0 – Nacional;

1 – Estrangeira (importação direta);

2 – Estrangeira (adquirida no mercado interno);

3 – Nacional com mais de 40% de conteúdo estrangeiro;

4 – Nacional produzida através de processos produtivos básicos;

5 – Nacional com menos de 40% de conteúdo estrangeiro;

6 – Estrangeira (importação direta) sem produto nacional similar;

7 – Estrangeira (adquirida no mercado interno) sem produto nacional similar;

* <strong>icms_situacao_tributaria</strong>: Informar qual a situação do ICMS para a operação. Valores possíveis:

00 – Tributada integralmente;

10 – Tributada e com cobrança do ICMS por substituição tributária;

20 – Tributada com redução de base de cálculo;

30 – Isenta ou não tributada e com cobrança do ICMS por substituição tributária;

40 – Isenta;

41 – Não tributada;

50 – Suspensão;

51 – Diferimento (a exigência do preenchimento das informações do ICMS diferido fica a critério de cada UF);

60 – Cobrado anteriormente por substituição tributária;

70 – Tributada com redução de base de cálculo e com cobrança do ICMS por substituição tributária;
90 – Outras (regime Normal);

101 – Ttributada pelo Simples Nacional com permissão de crédito;

102 – Tributada pelo Simples Nacional sem permissão de crédito;

103 – Isenção do ICMS no Simples Nacional para faixa de receita bruta;

201 – Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária;

202 – Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária;

203 – Isenção do ICMS nos Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária;

300 – Imune;

400 – Não tributada pelo Simples Nacional;

500 – ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação;

900 – Outras (regime Simples Nacional);

pis_situacao_tributaria: Informar qual a situação do PIS para a operação. Valores possíveis:
01 – Operação tributável: base de cálculo = valor da operação (alíquota normal – cumulativo/não cumulativo);

02 – Operação tributável: base de cálculo = valor da operação (alíquota diferenciada);

03 – Operação tributável: base de cálculo = quantidade vendida × alíquota por unidade de produto;

04 – Operação tributável: tributação monofásica (alíquota zero);

05 – Operação tributável: substituição tributária;

06 – Operação tributável: alíquota zero;

07 – Operação isenta da contribuição;

08 – Operação sem incidência da contribuição;

09 – Operação com suspensão da contribuição;

49 – Outras operações de saída;

50 – Operação com direito a crédito: vinculada exclusivamente a receita tributada no mercado interno;

51 – Operação com direito a crédito: vinculada exclusivamente a receita não tributada no mercado interno;

52 – Operação com direito a crédito: vinculada exclusivamente a receita de exportação;

53 – Operação com direito a crédito: vinculada a receitas tributadas e não-tributadas no mercado interno;

54 – Operação com direito a crédito: vinculada a receitas tributadas no mercado interno e de exportação;

55 – Operação com direito a crédito: vinculada a receitas não-tributadas no mercado interno e de exprtação;

56 – Operação com direito a crédito: vinculada a receitas tributadas e não-tributadas no mercado interno e de exportação;

60 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita tributada no mercado interno;

61 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita não-tributada no mercado interno;

62 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita de exportação;

63 – Crédito presumido: operação de aquisição vinculada a receitas tributadas e não-tributadas no mercado interno;

64 – Crédito presumido: operação de aquisição vinculada a receitas tributadas no mercado interno e de exportação;

65 – Crédito presumido: operação de aquisição vinculada a receitas não-tributadas no mercado interno e de exportação;

66 – Crédito presumido: operação de aquisição vinculada a receitas tributadas e não-tributadas no mercado interno e de exportação;

67 – Crédito presumido: outras operações;

70 – Operação de aquisição sem direito a crédito;

71 – Operação de aquisição com isenção;

72 – Operação de aquisição com suspensão;

73 – Operação de aquisição a alíquota zero;

74 – Operação de aquisição sem incidência da contribuição;

75 – Operação de aquisição por substituição tributária;

98 – Outras operações de entrada;

99 – Outras operações;

* <strong>cofins_situacao_tributaria</strong>: Informar qual a situação do CONFINS para a operação. Valores possíveis:

01 – Operação tributável: base de cálculo = valor da operação (alíquota normal – cumulativo/não cumulativo);

02 – Operação tributável: base de cálculo = valor da operação (alíquota diferenciada);

03 – Operação tributável: base de cálculo = quantidade vendida × alíquota por unidade de produto;

04 – Operação tributável: tributação monofásica (alíquota zero);

05 – Operação tributável: substituição tributária;

06 – Operação tributável: alíquota zero;

07 – Operação isenta da contribuição;

08 – Operação sem incidência da contribuição;

09 – Operação com suspensão da contribuição;

49 – Outras operações de saída;

50 – Operação com direito a crédito: vinculada exclusivamente a receita tributada no mercado interno;

51 – Operação com direito a crédito: vinculada exclusivamente a receita não tributada no mercado

interno;

52 – Operação com direito a crédito: vinculada exclusivamente a receita de exportação;

53 – Operação com direito a crédito: vinculada a receitas tributadas e não-tributadas no mercado interno;

54 – Operação com direito a crédito: vinculada a receitas tributadas no mercado interno e de exportação;

55 – Operação com direito a crédito: vinculada a receitas não-tributadas no mercado interno e de exportação;

56 – Operação com direito a crédito: vinculada a receitas tributadas e não-tributadas no mercado interno e de exportação;

60 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita tributada no mercado interno;

61 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita não-tributada no mercado interno;

62 – Crédito presumido: operação de aquisição vinculada exclusivamente a receita de exportação;

63 – Crédito presumido: operação de aquisição vinculada a receitas tributadas e não-tributadas no mercado interno;

64 – Crédito presumido: operação de aquisição vinculada a receitas tributadas no mercado interno e de exportação;

65 – Crédito presumido: operação de aquisição vinculada a receitas não-tributadas no mercado interno e de exportação;

66 – Crédito presumido: operação de aquisição vinculada a receitas tributadas e não-tributadas no mercado interno e de exportação;

67 – Crédito presumido: outras operações;

70 – Operação de aquisição sem direito a crédito;

71 – Operação de aquisição com isenção;

72 – Operação de aquisição com suspensão;

73 – Operação de aquisição a alíquota zero;

74 – Operação de aquisição sem incidência da contribuição;

75 – Operação de aquisição por substituição tributária;

98 – Outras operações de entrada;

99 – Outras operações;

* <strong>icms_base_calculo</strong>: Valor total da base de cálculo do ICMS. Assume zero se não informado.
* <strong>icms_valor_total</strong>: Valor total do ICMS. Assume zero se não informado.
* <strong>icms_base_calculo_st</strong>: Valor total da base de cálculo do ICMS do substituto tributário. Assume zero se não informado.
* <strong>icms_valor_total_st</strong>: Valor total do ICMS do substituto tributário. Assume zero se não informado.
* <strong>valor_produtos</strong>: Valor total dos produtos. Assume zero se não informado.
* <strong>valor_frete</strong>: Valor total do frete. Assume zero se não informado.
* <strong>valor_seguro</strong>: Valor total do seguro. Assume zero se não informado.
* <strong>valor_desconto</strong>: Valor total do desconto. Assume zero se não informado.
* <strong>ipi_valor</strong>: Valor total do IPI. Assume zero se não informado.
* <strong>pis_valor</strong>: Valor do PIS. Assume zero se não informado.
* <strong>cofins_valor</strong>: Valor do COFINS. Assume zero se não informado.
* <strong>valor_outras_despesas</strong>: Valor das despesas acessórias. Assume zero se não informado.
* <strong>valor_total</strong>: Valor total da nota fiscal.
* <strong>modalidade_frete</strong>: Indica a modalidade do frete da operação. Valores possíveis:

0 – Por conta do emitente;

1 – Por conta do destinatário;

2 – Por conta de terceiros;

9 – Sem frete;

### Campos calculados automaticamente

Para simplificar o envio da nota fiscal, alguns campos são calculados automaticamente a partir da versão 4.00 da NFe. Os campos calculados são somatórios de campos fornecidos nos itens da nota fiscal. Os campos serão calculados apenas se eles não forem informados na API.

A lista de campos calculados automaticamente segue abaixo:

| Campo                                     | Somatório de campo dos itens        | Observação                                                  |
|-------------------------------------------|-------------------------------------|-------------------------------------------------------------|
| icms_base_calculo                         | icms_base_calculo                   |                                                             |
| valor_ipi                                 | ipi_valor                           |                                                             |
| icms_valor_total_st                       | icms_valor_st                       |                                                             |
| issqn_base_calculo                        | issqn_base_calculo                  |                                                             |
| issqn_valor_total                         | issqn_valor                         |                                                             |
| issqn_valor_total_deducao                 | issqn_valor_deducao                 |                                                             |
| issqn_valor_total_outras_retencoes        | issqn_valor_outras_retencoes        |                                                             |
| issqn_valor_total_desconto_incondicionado | issqn_valor_desconto_incondicionado |                                                             |
| issqn_valor_total_desconto_condicionado   | issqn_valor_desconto_condicionado   |                                                             |
| issqn_valor_total_retencao                | issqn_valor_retencao                |                                                             |
| issqn_base_calculo                        | issqn_base_calculo                  |                                                             |
| valor_total_ii                            | ii_valor                            |                                                             |
| fcp_valor_total                           | fcp_valor                           |                                                             |
| fcp_valor_total_uf_destino                | fcp_valor_uf_destino                |                                                             |
| fcp_valor_total_st                        | fcp_valor_st                        |                                                             |
| fcp_valor_total_retido_st                 | fcp_valor_retido_st                 |                                                             |
| icms_valor_total_uf_destino               | icms_valor_uf_destino               |                                                             |
| icms_valor_total_uf_remetente             | icms_valor_uf_remetente             |                                                             |
| icms_base_calculo                         | icms_base_calculo                   |                                                             |
| icms_valor_total                          | icms_valor                          |                                                             |
| icms_valor_total_desonerado               | icms_valor_desonerado               |                                                             |
| icms_base_calculo_st                      | icms_base_calculo_st                |                                                             |
| icms_valor_total_st                       | icms_valor_st                       |                                                             |
| valor_frete                               | valor_frete                         |                                                             |
| valor_seguro                              | valor_seguro                        |                                                             |
| valor_outras_despesas                     | valor_outras_despesas               |                                                             |
| valor_desconto                            | valor_desconto                      |                                                             |
| valor_ipi_devolvido                       | valor_ipi_devolvido                 |                                                             |
| valor_total_tributos                      | valor_total_tributos                |                                                             |
| valor_produtos                            | valor_bruto                         | Apenas se inclui_no_total=1                                 |
| valor_total_servicos                      | valor_bruto                         | Apenas se inclui_no_total=1 e item de serviço               |
| icms_valor_total                          | icms_valor                          | Apenas se icms_situacao_tributaria diferente de40, 41 e 50. |
| valor_pis_servicos                        | pis_valor                           | Apenas se item de serviço                                   |
| valor_cofins_servicos                     | cofins_valor                        | Apenas se item de serviço                                   |
| valor_pis                                 | pis_valor                           | Apenas se não for item de serviço                           |
| valor_cofins                              | cofins_valor                        | Apenas se não for item de serviço

## Status API

Aqui você encontra os status possíveis para NFe.

HTTP CODE/STATUS | Status API Focus | Descrição | Correção
---|---|---|---|
422 - unprocessable entity | erro_validacao_schema | Erro na validação do Schema XML. | Verifique o detalhamento do erro na resposta da API.
422 - unprocessable entity | nfe_nao_autorizada | Nota fiscal não autorizada. | O cancelamento só é possível para NFe's autorizadas.
404 - not found | nao_encontrado | Utilize o método POST. | O método de envio usado é diferente de POST, por favor, use o HTTP POST.
404 - not found | nao_encontrado | Nota fiscal não encontrada. | Verifique se a nota a ser cancelada realmente existe antes de enviar o cancelamento.
400 - bad request | requisicao_invalida | Parâmetro "justificativa" não informado. | Você precisa usar o parâmetro 'justificativa'. Consulte a nossa documentação.
400 - bad request | requisicao_invalida | Parâmetro "justificativa" deve ter entre 15 e 255 caracteres. | A sua justificativa não possui de 15 à 255 careacteres.
400 - bad request | requisicao_invalida | Parâmetro X não informado. | Onde X é o campo que não foi informado em sua requisição.
400 - bad request | requisicao_invalida | Não existe série com os critérios informados. | Os critérios de inutilização não existem. Verifique a nossa documentação.
400 - bad request | requisicao_invalida | CNPJ do emitente não autorizado ou não informado. | Verifique o campo "cnpj_emitente" em seu JSON. É preciso habilitar a emissão de NFe no cadastro do emitente(Painel API).
400 - bad request | requisicao_invalida | CNPJ/UF do emitente não autorizado ou não informado. | Verifique os campos "cnpj_emitente" e "uf_emitente". É preciso habilitar a emissão de NFe no cadastro do emitente(Painel API).
403 - forbidden | permissao_negada | CNPJ do emitente não autorizado. | O emitente utilizado não está autorizado a emitir NFe ou foi informado o CNPJ do emitente incorretamente no JSON.

## Envio


```shell
# arquivo.json deve conter os dados da NFe, substitua REFERENCIA pela referência de sua escolha
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.json https://homologacao.focusnfe.com.br/v2/nfe?ref=REFERENCIA
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$nfe = array (
  "natureza_operacao" => "Remessa",
  "data_emissao" => "2017-11-30T12:00:00",
  "data_entrada_saida" => "2017-11-3012:00:00",
  "tipo_documento" => "1",
  "finalidade_emissao" => "1",
  "cnpj_emitente" => "51916585000125",
  "nome_emitente" => "ACME LTDA",
  "nome_fantasia_emitente" => "ACME LTDA",
  "logradouro_emitente" => "R. Padre Natal Pigato",
  "numero_emitente" => "100",
  "bairro_emitente" => "Santa Felicidade",
  "municipio_emitente" => "Curitiba",
  "uf_emitente" => "PR",
  "cep_emitente" => "82320030",
  "inscricao_estadual_emitente" => "101942171617",
  "nome_destinatario" => "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  "cpf_destinatario" => "51966818092",
  "telefone_destinatario" => "1196185555",
  "logradouro_destinatario" => "Rua S\u00e3o Janu\u00e1rio",
  "numero_destinatario" => "99",
  "bairro_destinatario" => "Crespo",
  "municipio_destinatario" => "Manaus",
  "uf_destinatario" => "AM",
  "pais_destinatario" => "Brasil",
  "cep_destinatario" => "69073178",
  "valor_frete" => "0.0",
  "valor_seguro" => "0",
  "valor_total" => "47.23",
  "valor_produtos" => "47.23",
  "modalidade_frete" => "0",
  "items" => array(
    array(
      "numero_item" => "1",
      "codigo_produto" => "1232",
      "descricao" => "Cartu00f5es de Visita",
      "cfop" => "6923",
      "unidade_comercial" => "un",
      "quantidade_comercial" => "100",
      "valor_unitario_comercial" => "0.4723",
      "valor_unitario_tributavel" => "0.4723",
      "unidade_tributavel" => "un",
      "codigo_ncm" => "49111090",
      "quantidade_tributavel" => "100",
      "valor_bruto" => "47.23",
      "icms_situacao_tributaria" => "400",
      "icms_origem" => "0",
      "pis_situacao_tributaria" => "07",
      "cofins_situacao_tributaria" => "07"
    )
  ),
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfe?ref=" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($nfe));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java

import java.util.HashMap;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeAutorizar {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe?ref="+ref);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    /* Aqui são criados as hash's que receberão os dados da nota. */
    HashMap<String, String> nfe = new HashMap<String, String>();
    HashMap<String, String> itens = new HashMap<String, String>();

    nfe.put("data_emissao", "2018-01-16T09:38:00");
    nfe.put("natureza_operacao", "Remessa de Produtos");
    nfe.put("forma_pagamento", "0");
    nfe.put("tipo_documento", "1");
    nfe.put("finalidade_emissao", "1");
    nfe.put("cnpj_emitente", "51916585000125");
    nfe.put("nome_emitente", "ACME LTDA");
    nfe.put("nome_fantasia_emitente", "ACME TESTES");
    nfe.put("logradouro_emitente", "Rua Interventor Manoel Ribas");
    nfe.put("numero_emitente", "1355 ");
    nfe.put("bairro_emitente", "Santa Felicidade");
    nfe.put("municipio_emitente", "Curitiba");
    nfe.put("uf_emitente", "PR");
    nfe.put("cep_emitente", "82320030");
    nfe.put("telefone_emitente", "44912345678");
    nfe.put("inscricao_estadual_emitente", "1234567");
    nfe.put("nome_destinatario", "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL");
    nfe.put("cpf_destinatario", "51966818092");
    nfe.put("inscricao_estadual_destinatario", "ISENTO");
    nfe.put("telefone_destinatario", "19912345678");
    nfe.put("logradouro_destinatario", "Rua Leonor Campos");
    nfe.put("numero_destinatario", "29");
    nfe.put("bairro_destinatario", "Swiss Park");
    nfe.put("municipio_destinatario", "Campinas");
    nfe.put("uf_destinatario", "SP");
    nfe.put("pais_destinatario", "Brasil");
    nfe.put("cep_destinatario", "13049555");
    nfe.put("icms_base_calculo", "0");
    nfe.put("icms_valor_total", "0");
    nfe.put("icms_base_calculo_st", "0");
    nfe.put("icms_valor_total_st", "0");
    nfe.put("icms_modalidade_base_calculo", "0");
    nfe.put("icms_valor", "0");
    nfe.put("valor_frete", "0");
    nfe.put("valor_seguro", "0");
    nfe.put("valor_total", "1");
    nfe.put("valor_produtos", "1");
    nfe.put("valor_desconto", "0.00");
    nfe.put("valor_ipi", "0");
    nfe.put("modalidade_frete", "1");
    itens.put("numero_item","128");
    itens.put("codigo_produto","1007");
    itens.put("descricao","Multi Mist 500g");
    itens.put("cfop","6102");
    itens.put("unidade_comercial","un");
    itens.put("quantidade_comercial","1");
    itens.put("valor_unitario_comercial","1");
    itens.put("valor_unitario_tributavel","1");
    itens.put("unidade_tributavel","un");
    itens.put("codigo_ncm","11041900");
    itens.put("valor_frete","0");
    itens.put("valor_desconto","0.00");
    itens.put("quantidade_tributavel","1");
    itens.put("valor_bruto","1");
    itens.put("icms_situacao_tributaria","103");
    itens.put("icms_origem","0");
    itens.put("pis_situacao_tributaria","07");
    itens.put("cofins_situacao_tributaria","07");
    itens.put("ipi_situacao_tributaria","53");
    itens.put("ipi_codigo_enquadramento_legal","999");

    /* Depois de fazer o input dos dados, são criados os objetos JSON já com os valores das hash's. */
    JSONObject json = new JSONObject (nfe);
    JSONObject jsonItens = new JSONObject (itens);

    /* Aqui adicionamos os objetos JSON nos campos da API como array no JSON principal. */
    json.append("items", jsonItens);

    /* É recomendado verificar como os dados foram gerados em JSON e se ele está seguindo a estrutura especificada em nossa documentação.
    System.out.print(json); */

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* As três linhas a seguir exibem as informações retornadas pela nossa API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}

```

```ruby
# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe?ref=" + ref

# altere os campos conforme a nota que será enviada
dados_da_nota = {
  natureza_operacao: "Remessa",
  data_emissao: "2017-11-30T12:00:00",
  data_entrada_saida: "2017-11-3012:00:00",
  tipo_documento: "1",
  finalidade_emissao: "1",
  cnpj_emitente: "51916585000125",
  nome_emitente: "ACME LTDA",
  nome_fantasia_emitente: "ACME LTDA",
  logradouro_emitente: "R. Padre Natal Pigato",
  numero_emitente: "100",
  bairro_emitente: "Santa Felicidade",
  municipio_emitente: "Curitiba",
  uf_emitente: "PR",
  cep_emitente: "82320030",
  inscricao_estadual_emitente: "101942171617",
  nome_destinatario: "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
  cpf_destinatario: "51966818092",
  telefone_destinatario: "1196185555",
  logradouro_destinatario: "Rua Sao Januario",
  numero_destinatario: "99",
  bairro_destinatario: "Crespo",
  municipio_destinatario: "Manaus",
  uf_destinatario: "AM",
  pais_destinatario: "Brasil",
  cep_destinatario: "69073178",
  valor_frete: "0.0",
  valor_seguro: "0",
  valor_total: "47.23",
  valor_produtos: "47.23",
  modalidade_frete: "0",
  items: [
    numero_item: "1",
    codigo_produto: "1232",
    descricao: "Cartu00f5es de Visita",
    cfop: "6923",
    unidade_comercial: "un",
    quantidade_comercial: "100",
    valor_unitario_comercial: "0.4723",
    valor_unitario_tributavel: "0.4723",
    unidade_tributavel: "un",
    codigo_ncm: "49111090",
    quantidade_tributavel: "100",
    valor_bruto: "47.23",
    icms_situacao_tributaria: "400",
    icms_origem: "0",
    pis_situacao_tributaria: "07",
    cofins_situacao_tributaria: "07"
  ]
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, "")

# convertemos os dados da nota para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = dados_da_nota.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe?ref=" + ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var nfe = {
"natureza_operacao": "Remessa",
"data_emissao": "2018-03-21T11:00:00",
"data_entrada_saida": "2018-03-21T11:00:00",
"tipo_documento": "1",
"finalidade_emissao": "1",
"cnpj_emitente": "51916585000125",
"nome_emitente": "ACME LTDA",
"nome_fantasia_emitente": "ACME LTDA",
"logradouro_emitente": "R. Padre Natal Pigato",
"numero_emitente": "100",
"bairro_emitente": "Santa Felicidade",
"municipio_emitente": "Curitiba",
"uf_emitente": "PR",
"cep_emitente": "82320030",
"inscricao_estadual_emitente": "1234567",
"nome_destinatario": "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL",
"cpf_destinatario": "51966818092",
"telefone_destinatario": "1196185555",
"logradouro_destinatario": "Rua S\u00e3o Janu\u00e1rio",
"numero_destinatario": "99",
"bairro_destinatario": "Crespo",
"municipio_destinatario": "Manaus",
"uf_destinatario": "AM",
"pais_destinatario": "Brasil",
"cep_destinatario": "69073178",
"valor_frete": "0.0",
"valor_seguro": "0",
"valor_total": "47.23",
"valor_produtos": "47.23",
"modalidade_frete": "0",
"items": [
    {
      "numero_item": "1",
      "codigo_produto": "1232",
      "descricao": "Cartu00f5es de Visita",
      "cfop": "6923",
      "unidade_comercial": "un",
      "quantidade_comercial": "100",
      "valor_unitario_comercial": "0.4723",
      "valor_unitario_tributavel": "0.4723",
      "unidade_tributavel": "un",
      "codigo_ncm": "49111090",
      "quantidade_tributavel": "100",
      "valor_bruto": "47.23",
      "icms_situacao_tributaria": "400",
      "icms_origem": "0",
      "pis_situacao_tributaria": "07",
      "cofins_situacao_tributaria": "07"
    }
  ]
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(nfe));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe"

# Substituir pela sua identificação interna da nota
ref = {"ref":"12345"}

token="token obtido no cadastro da empresa"

'''
Usamos dicionarios para armazenar os campos e valores que em seguida,
serao convertidos em JSON e enviados para nossa API
'''
nfe = {}
itens = {}
notas_referenciadas ={}

nfe["natureza_operacao"] = "Venda"
nfe["forma_pagamento"] = "0"
nfe["data_emissao"] = "2018-03-07T10:20:00-03:00"
nfe["tipo_documento"] = "0"
nfe["local_destino"] = "1"
nfe["finalidade_emissao"] = "4"
nfe["consumidor_final"] = "0"
nfe["presenca_comprador"] = "9"
nfe["cnpj_emitente"] = "99999999999999"
nfe["logradouro_emitente"] = "R. Padre Pigato"
nfe["numero_emitente"] = "9236"
nfe["bairro_emitente"] = "Santa Gula"
nfe["municipio_emitente"] = "Curitiba"
nfe["uf_emitente"] = "PR"
nfe["cep_emitente"] = "82320999"
nfe["telefone_emitente"] = "4199999999"
nfe["inscricao_estadual_emitente"] = "999999999"
nfe["regime_tributario_emitente"] = "1"
nfe["cpf_destinatario"] = "99999999999"
nfe["nome_destinatario"] = "NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
nfe["logradouro_destinatario"] = "Rua Prof. Yolanda Romeu Lugarini"
nfe["numero_destinatario"] = "1"
nfe["bairro_destinatario"] = "JD SANTA CECILIA"
nfe["municipio_destinatario"] = "CAMPO MAGRO"
nfe["uf_destinatario"] = "PR"
nfe["cep_destinatario"] = "83000000"
nfe["indicador_inscricao_estadual_destinatario"] = "2"
nfe["icms_base_calculo"] = "0"
nfe["icms_valor_total"] = "0"
nfe["icms_valor_total_desonerado"] = "0"
nfe["icms_base_calculo_st"] = "0"
nfe["icms_valor_total_st"] = "0"
nfe["valor_produtos"] = "1.00"
nfe["valor_frete"] = "0"
nfe["valor_seguro"] = "0"
nfe["valor_desconto"] = "0"
nfe["valor_total_ii"] = "0"
nfe["valor_ipi"] = "0"
nfe["valor_pis"] = "0"
nfe["valor_cofins"] = "0"
nfe["valor_outras_despesas"] = "0"
nfe["valor_total"] = "1.00"
nfe["modalidade_frete"] = "0"
notas_referenciadas["chave_nfe"] = 41170599999999999999550020000001111337477298
itens["numero_item"] = "1"
itens["codigo_produto"] = "ESSP"
itens["descricao"] = "Carrinho de corrida"
itens["cfop"] = "1202"
itens["unidade_comercial"] = "UN"
itens["quantidade_comercial"] = "1.00"
itens["valor_unitario_comercial"] = "1.00"
itens["valor_bruto"] = "1.00"
itens["valor_desconto"] = "0"
itens["unidade_tributavel"] = "UN"
itens["codigo_ncm"] = "49119900"
itens["quantidade_tributavel"] = "1.00"
itens["valor_unitario_tributavel"] = "1.00"
itens["inclui_no_total"] = "1"
itens["icms_origem"] = "0"
itens["icms_situacao_tributaria"] = "103"
itens["pis_situacao_tributaria"] = "99"
itens["cofins_situacao_tributaria"] = "99"

# Adicionamos os dados das variaveis itens e notas_referenciadas como listas ao dicionario principal.
nfe["items"] = [itens]
nfe["notas_referenciadas"] = [notas_referenciadas]

r = requests.post(url, params=ref, data=json.dumps(nfe), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para enviar uma NFe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Envia uma NFe para autorização:

`https://api.focusnfe.com.br/v2/nfe?ref=REFERENCIA`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API. Envie como corpo do POST os dados em formato JSON da nota fiscal.

Nesta etapa, é feita uma primeira validação dos dados da nota. Caso ocorra algum problema, por exemplo, algum campo faltante, formato incorreto
ou algum problema com o emitente a nota **não será aceita para processamento** e será devolvida a mensagem de erro apropriada. Veja a seção [erros](#introducao_erros).

Caso a nota seja validada corretamente, a nota será **aceita para processamento**. Isto significa que a nota irá para uma fila de processamento
onde eventualmente será processada (processamento assíncrono). Com isto, a nota poderá ser autorizada ou ocorrer um erro na autorização, de acordo com a validação da SEFAZ.

Para verificar se a nota já foi autorizada, você terá que efetuar uma [consulta](#nfe_consulta) ou se utilizar de [gatilhos/webhooks](#gatilhos-webhooks).

### Reenvio automático em contingência

Caso nossa equipe de monitoramento detecte que o SEFAZ de algum estado esteja fora do ar as requisições são redirecionadas para o ambiente de contingência da SEFAZ do estado. É natural haver uma demora na SEFAZ em disponibilizar esse ambiente (eles realizam este processo manualmente) porém nossa API irá continuar tentando o reenvio até que seja possível, seja pela emissão normal ou em contingência. Isto é feito de forma transparente aos clientes da API.

Porém, pode ocorrer uma situação em que o SEFAZ do estado fique indisponível no meio do processo de emissão de uma NFe. Neste momento nós não temos como saber se a nota foi autorizada ou não, até que a SEFAZ volte a ficar disponível.

Quando isto ocorre nós não esperamos a SEFAZ do estado voltar e reenviamos assim que possível para o ambiente de contingência, autorizando a nota e evitando a espera para o cliente final. Isto tem como efeito colateral que pode ser que a nota original tenha sido autorizada. Nossa API irá automaticamente detectar esta situação e proceder com o cancelamento da tentativa anterior. Por consequência, será natural haver um “pulo” de numeração percebido pelo cliente final.

O sistema cliente da API pode acompanhar este processo de forma transparente, conforme descrito na seção “Consulta” deste manual.

> Exemplos de respostas da API por **status** para a requisição de envio:

> autorizado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132550010000000221923094166",
  "numero": "22",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-nfe.xml",
  "caminho_danfe": "/arquivos_development/07504505000132/201906/DANFEs/41190607504505000132550010000000221923094166.pdf"
}
```

> erro_validacao_schema

```json
{
  "codigo": "erro_validacao_schema",
  "mensagem": "Erro na validação do Schema XML, verifique o detalhamento dos erros",
  "erros": [
    {
      "mensagem": "Preencha pelo menos um documento do destinatário: cnpj_destinatario ou cpf_destinatario",
      "campo": null
    }
  ]
}
```

### Envio síncrono

É possível configurar a empresa para realizar a emissão síncrona. Contate o suporte técnico para alterar o tipo de emissão de sua empresa.

Este tipo de emissão pode ser útil para pequenos envios que necessitam de autorização em tempo real. Para emissão de grandes lotes, recomendamos o uso da emissão assíncrona.

Quando a emissão é síncrona, será feita uma tentativa de envio e caso a nota tenha sido autorizada será devolvido o resultado do processamento *na mesma requisição* com o código de status HTTP 201 (Created). Caso ocorra algum erro, como por exemplo se o servidor da SEFAZ estiver fora do ar, a nota é enfileirada da mesma forma que o envio assíncrono.

Alguns estados não aceitam a emissão síncrona, são eles: SP, GO e BA.

Tipo de Emissão | Status HTTP se sucesso | Resposta | Observações
-------|-------|-----|------
assíncrona (default) | 202 - Accepted | Dados da nota com status processando_autorizacao | Necessário consultar a nota posteriormente ou utilizar webhooks para receber o resultado do processamento
síncrona | 201 - Created | Dados da nota autorizada ou mensagem de erro | A emissão síncrona pode não estar disponível, neste caso será devolvido código de status 202 - Accepted e a nota será enfileirada



## Consulta


```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

# Use este parametro para obter mais informacoes em suas consultas
completa = "completa=1"

r = requests.get(url+ref, params=completa, auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

```shell
curl -u "token obtido no cadastro da empresa:" \
  https://homologacao.focusnfe.com.br/v2/nfe/12345
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfe/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array());
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeConsulta {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe/"+ref+"?completa=1");

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.get(ClientResponse.class);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe/" + ref

# criamos um objeto uri para envio da nota
uri = URI(url_envio)
# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Get a partir da uri de requisição
requisicao = Net::HTTP::Get.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe/" + ref + "?completa=1";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('GET', url, false, token);

request.send();

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

> Exemplo de resposta com o parâmetro opcional, **completa**, recebendo o valor "1":

```json
{
    "requisicao_cancelamento": {
    "versao": "1.00",
    "id_tag": "ID1101119118017764335300017255003000000025138154946401",
    "codigo_orgao": "41",
    "ambiente": "2",
    "cnpj": "CNPJ_DO_EMITENTE",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "data_evento": "2012-01-17T16:00:28-02:00",
    "tipo_evento": "110111",
    "numero_sequencial_evento": "1",
    "versao_evento": "1.00",
    "descricao_evento": "Cancelamento",
    "protocolo": "141180000026777",
    "justificativa": "Informe aqui a sua justificativa para realizar o cancelamento da NFe."
  },
  "protocolo_cancelamento": {
    "versao": "1.00",
    "ambiente": "2",
    "versao_aplicativo": "PR-v3_8_7",
    "codigo_orgao": "41",
    "status": "135",
    "motivo": "Evento registrado e vinculado a NF-e",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "tipo_evento": "110111",
    "descricao_evento": "Cancelamento",
    "data_evento": "2012-01-17T16:00:31-02:00",
    "numero_protocolo": "141180000026777"
  },
   "requisicao_carta_correcao": {
    "versao": "1.00",
    "id_tag": "ID1101109118017764335300017255003000000025138154946401",
    "codigo_orgao": "41",
    "ambiente": "2",
    "cnpj": "CNPJ_DO_EMITENTE",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "data_evento": "2012-01-17T15:59:34-02:00",
    "tipo_evento": "110110",
    "numero_sequencial_evento": "1",
    "versao_evento": "1.00",
    "descricao_evento": "Carta de Correcao",
    "correcao": "Informe aqui os campos que foram corrigidos na NFe.",
    "condicoes_uso": "A Carta de Correcao e disciplinada pelo paragrafo 1o-A do art. 7o do Convenio S/N, de 15 de dezembro de 1970 e pode ser utilizada para regularizacao de erro ocorrido na emissao de documento fiscal, desde que o erro nao esteja relacionado com: I - as variaveis que determinam o valor do imposto tais como: base de calculo, aliquota, diferenca de preco, quantidade, valor da operacao ou da prestacao; II - a correcao de dados cadastrais que implique mudanca do remetente ou do destinatario; III - a data de emissao ou de saida."
  },
  "protocolo_carta_correcao": {
    "versao": "1.00",
    "ambiente": "2",
    "versao_aplicativo": "PR-v3_8_7",
    "codigo_orgao": "41",
    "status": "135",
    "motivo": "Evento registrado e vinculado a NF-e",
    "chave_nfe": "91180177643353000172550030000000251381549464",
    "tipo_evento": "110110",
    "descricao_evento": "Carta de Correção",
    "data_evento": "2012-01-17T15:59:37-02:00",
    "numero_protocolo": "141180000026777"
  }
}
```
> Exemplos de respostas da API por **status** para a requisição de consulta:

> autorizado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132550010000000221923094166",
  "numero": "22",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-nfe.xml",
  "caminho_danfe": "/arquivos_development/07504505000132/201906/DANFEs/41190607504505000132550010000000221923094166.pdf"
}
```

> autorizado (com CCe)

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "autorizado",
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "chave_nfe": "NFe41190607504505000132550010000000221923094166",
  "numero": "22",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-nfe.xml",
  "caminho_danfe": "/arquivos_development/07504505000132/201906/DANFEs/41190607504505000132550010000000221923094166.pdf",
  "caminho_xml_carta_correcao": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-cce-01.xml",
  "caminho_pdf_carta_correcao": "/notas_fiscais/NFe41190607504505000132550010000000221923094166/cartas_correcao/1.pdf",
  "numero_carta_correcao": 1
}
```

> processando_autorizacao

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "processando_autorizacao"
}
```

> erro_autorizacao

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "erro_autorizacao",
  "status_sefaz": "598",
  "mensagem_sefaz": "NF-e emitida em ambiente de homologacao com Razao Social do destinatario diferente de NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL"
}
```

> cancelado

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "referencia_000899_nfe",
  "status": "cancelado",
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "numero": "22",
  "serie": "1",
  "chave_nfe": "NFe41190607504505000132550010000000221923094166",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-nfe.xml",
  "caminho_xml_cancelamento": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-can.xml",
  "caminho_xml_carta_correcao": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-cce-02.xml",
  "caminho_pdf_carta_correcao": "/notas_fiscais/NFe41190607504505000132550010000000221923094166/cartas_correcao/2.pdf",
  "numero_carta_correcao": 2
}
```

Após emitir uma nota, você poderá usar a operação de consulta para verificar se a nota já foi aceita para processamento, se está
ainda em processamento ou se a nota já foi processada.

Para consultar uma NFe utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Consultar as informações de uma NFe:

`https://api.focusnfe.com.br/v2/nfe/REFERENCIA?completa=(0|1)`

Utilize o comando **HTTP GET** para consultar a sua nota para nossa API.

Parâmetro Opcional | Ação
-------|-------|-----
completa = 0 ou 1 | Habilita a API há mostrar campos adicionais na requisição de consulta.

Campos de retorno:

* **status**: A situação da NFe, podendo ser:
  - **processando_autorizacao**: A nota ainda está em processamento pela API. Você deverá aguardar o processamento pela SEFAZ.
  - **autorizado**: A nota foi autorizada, neste caso é fornecido os dados completos da nota como chave e arquivos para download
  - **cancelado**: O documento foi cancelado, neste caso é fornecido o caminho para download do XML de cancelamento (caminho_xml_cancelamento).
  - **erro_autorizacao**: Houve um erro de autorização por parte da SEFAZ. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. É possível fazer o reenvio da nota com a mesma referência se ela estiver neste estado.
  - **denegado**: O documento foi denegado. Uma SEFAZ pode denegar uma nota se houver algum erro cadastral nos dados do destinatário ou do emitente. A mensagem de erro você encontrará nos campos status_sefaz e mensagem_sefaz. Não é possível reenviar a nota caso este estado seja alcançado pois é gerado um número, série, chave de NFe e XML para esta nota. O XML deverá ser armazenado pelo mesmo período de uma nota autorizada ou cancelada.
* **status_sefaz**: O status da nota na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: A série da nota fiscal, caso ela tenha sido autorizada.
* **numero**: O número da nota fiscal, caso ela tenha sido autorizada.
* **cnpj_emitente**: O CNPJ emitente da nota fiscal (o CNPJ de sua empresa).
* **ref**:A referência da emissão.
* **chave_nfe**: A chave da NFe, caso ela tenha sido autorizada.
* **caminho_xml_nota_fiscal**: caso a nota tenha sido autorizada, retorna o caminho para download do XML.
* **caminho_danfe**: caso a nota tenha sido autorizada retorna o caminho para download do DANFe.
* **caminho_xml_carta_correcao**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do XML.
* **caminho_pdf_carta_correcao**: caso tenha sido emitida alguma carta de correção, aqui aparecerá o caminho para fazer o download do PDF da carta.
* **numero_carta_correcao**: o número da carta de correção, caso tenha sido emitida.
* **caminho_xml_cancelamento**: Caso a nota esteja cancelada, é fornecido o caminho para fazer o download do XML de cancelamento.

Caso na requisição seja passado o parâmetro `completa=1` será adicionado mais 6 campos:

* **requisicao_nota_fiscal**: Inclui os dados completos da requisição da nota fiscal, da mesma forma que constam no XML da nota.
* **protocolo_nota_fiscal**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_cancelamento**: Inclui os dados completos da requisição de cancelamento da nota fiscal.
* **protocolo_cancelamento**: Inclui os dados completos do protocolo devolvido pela SEFAZ.
* **requisicao_carta_correcao**: Inclui os dados completos da requisição de Carta de Correção Eletrônica da NFe.
* **protocolo_carta_correcao**: Inclui os dados completos do protocolo devolvido pela SEFAZ.

### Reenvio Automático em Contingência – algumas considerações

Quando houver uma tentativa anterior de emissão, conforme descrito na seção “Reenvio automático em contingência”. A API irá devolver a chave `tentativa_anterior` que irá conter os seguintes campos:

* status: autorizado, processando_autorizacao ou cancelado. A API irá automaticamente proceder com o cancelamento quando necessário
* serie
* numero
* chave_nfe
* caminho_xml_nota_fiscal
* caminho_xml_cancelamento

### Download do XML da NFe

Após a autorização da nota fiscal eletrônica será disponibilizado os campos:

caminho_xml_nota_fiscal - Representa o caminho para montar a URL para download do XML. Por exemplo, se você utilizou o ambiente de produção (https://api.focusnfe.com.br) e o caminho_xml_nota_fiscal contém o caminho "/arquivos_development/77623353000000/201201/XMLs/91180177643353000172550030000000251381549464-nfe.xml" você poderá acessar o XML pela URL completa https://api.focusnfe.com.br/arquivos_development/77623353000000/201201/XMLs/91180177643353000172550030000000251381549464-nfe.xml

Utilize o método **HTTP GET** para essa consulta.

Existe obrigatoriedade legal para armazenar o XML de todas as notas NFe (modelo 55) por pelo menos 5 anos após a data de autorização da nota. Nossa API faz a guarda automática dos arquivos por esse período.

## Cancelamento


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X DELETE -d '{"justificativa":"Teste de cancelamento de nota"}' \
  https://homologacao.focusnfe.com.br/v2/nfe/12345
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$justificativa = array ("justificativa" => "Teste de cancelamento de nota");
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server . "/v2/nfe/" . $ref);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($justificativa));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeCancelamento {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe/"+ref);
    /* Aqui criamos um hashmap para receber a chave "justificativa" e o valor desejado. */
    HashMap<String, String> justificativa = new HashMap<String, String>();
    justificativa.put("justificativa", "Informe aqui a sua justificativa para realizar o cancelamento da NFe.");

    /* Criamos um objeto JSON para receber a hash com os dados esperado pela API. */
    JSONObject json = new JSONObject(justificativa);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.delete(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

     /* As três linhas abaixo imprimem as informações retornadas pela API.
        * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe/" + ref

# altere os campos conforme a nota que será enviada
justificativa_cancelamento = {
  justificativa: "Informe aqui a sua justificativa para realizar o cancelamento da NFe."
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Delete a partir da uri de requisição
requisicao = Net::HTTP::Delete.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = justificativa_cancelamento.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe/"+ ref;

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('DELETE', url, false, token);

var cancelar = {

  "justificativa": "Sua justificativa aqui!"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(cancelar));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
justificativa={}
justificativa["justificativa"] = "Sua justificativa aqui!"

r = requests.delete(url+ref, data=json.dumps(justificativa), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para cancelar uma NFe, basta fazer uma requisição à URL abaixo, alterando o ambiente de produção para homologação, caso esteja emitindo notas de teste.

Cancelar uma NFe já autorizada:

`https://api.focusnfe.com.br/v2/nfe/REFERENCIA`

Utilize o comando **HTTP DELETE** para cancelar a sua nota para nossa API. Este método é síncrono, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetro de cancelamento deverá ser enviado da seguinte forma:

* **justificativa**: Justificativa do cancelamento. Deverá conter de 15 a 255 caracteres.

A API irá em seguida devolver os seguintes campos:

* **status**: cancelado, se a nota pode ser cancelada, ou erro_cancelamento, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status do cancelamento na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml_cancelamento**: Caso a nota tenha sido cancelada, será informado aqui o caminho para download do XML de cancelamento.

### Prazo de cancelamento
A NFe poderá ser cancelada em até 24 horas após a emissão. No entanto, alguns estados podem permitir um prazo maior para o cancelamento.

> Exemplos de respostas da API por **status** para a requisição de cancelamento:

> cancelado

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "status": "cancelado",
  "caminho_xml_cancelamento": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-can.xml"
}
```

> requisicao_invalida

```json
{
  "codigo": "requisicao_invalida",
  "mensagem": "Parâmetro \"justificativa\" deve ter entre 15 e 255 caracteres"
}
```

## Carta de Correção Eletrônica

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"correcao":"Teste de carta de correcao"}' \
  https://homologacao.focusnfe.com.br/v2/nfe/12345/carta_correcao
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$correcao = array (
  "correcao" => "Teste de carta de correcao",
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server . "/v2/nfe/" . $ref  . "/carta_correcao");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($correcao));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeCCe {

  public static void main(String[] args){

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe/"+ref+"/carta_correcao");

    /* Aqui criamos um hashmap para receber a chave "correcao" e o valor desejado. */
    HashMap<String, String> correcao = new HashMap<String, String>();
    correcao.put("correcao", "Informe aqui os campos que foram corrigidos na NFe.");

    /* Criamos um objeto JSON para receber a hash com os dados esperado pela API. */
    JSONObject json = new JSONObject(correcao);

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

     /* As três linhas abaixo imprimem as informações retornadas pela API.
    * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe/" + ref + "/carta_correcao"

# altere os campos conforme a nota que será enviada
correcao = {
  correcao: "Informe aqui os campos que foram corrigidos na NFe."
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = correcao.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe/"+ ref + "/carta_correcao";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var cce = {

  "correcao": "A sua correção aqui!"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(cce));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
cce={}
cce["correcao"] = "A sua correção aqui!"

r = requests.post(url+ref+"/carta_correcao", data=json.dumps(cce), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```
> Exemplos de respostas da API por **status** para a requisição de carta de correção:

> autorizado

```json
{
  "status_sefaz": "135",
  "mensagem_sefaz": "Evento registrado e vinculado a NF-e",
  "status": "autorizado",
  "caminho_xml_carta_correcao": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-cce-01.xml",
  "caminho_pdf_carta_correcao": "/notas_fiscais/NFe41190607504505000132550010000000221923094166/cartas_correcao/1.pdf",
  "numero_carta_correcao": 1
}
```

Uma Carta de Correção eletrônica (CCe) pode ser utilizada para corrigir eventuais erros na NFe. As seguintes informações **não podem ser corrigidas**:

* As variáveis que determinam o valor do imposto tais como: base de cálculo, alíquota, diferença de preço, quantidade, valor da operação ou da prestação;
* A correção de dados cadastrais que implique mudança do remetente ou do destinatário;
* A data de emissão ou de saída.

Não existe prazo especificado para emissão de cartas de correção. É possível enviar até 20 correções diferentes, sendo que será válido sempre a última correção enviada.

### Emissão de CCe

`https://api.focusnfe.com.br/v2/nfe/REFERENCIA/carta_correcao`

Utilize o comando **HTTP POST** para enviar a sua nota para nossa API. Este método é **síncrono**, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

O parâmetros da carta de correção deverão ser enviados da seguinte forma:

* **correcao**: Texto da carta de correção. Deverá conter de 15 a 1000 caracteres.
* **data_evento**: Campo opcional. Data do evento da carta de correção. Se não informado será usado a data atual

A API irá em seguida devolver os seguintes campos:

* **status**: autorizado, se a carta de correção foi aceita pela SEFAZ, ou erro_autorizacao, se houve algum erro ao cancelar a nota.
* **status_sefaz**: O status da carta de correção na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **caminho_xml_carta_correcao**: Informa o caminho do XML da carta de correção, caso ela tenha sido autorizada.
* **caminho_pdf_carta_correcao**: Informa o caminho do PDF da carta de correção, caso ela tenha sido autorizada.
* **numero_carta_correcao**: Informa o número da carta de correção, caso ela tenha sido autorizada.

Para uma mesma nota fiscal é possível enviar mais de uma carta de correção, até o limite de 20 correções, sendo que a última sempre substitui a anterior.

## Reenvio de e-mail

```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"emails":["alguem@example.org"]}' \
  https://homologacao.focusnfe.com.br/v2/nfe/12345/email
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$ref = "12345";
$login = "token obtido no cadastro da empresa";
$password = "";
$email = array (
  "emails" => array(
    "email@email.com"
    )
  );
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfe/" . $ref . "/email");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($email));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeEnviaEmail {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Substituir pela sua identificação interna da nota. */
    String ref = "12345";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe/"+ref+"/email");

    /* Criamos o um objeto JSON que receberá um JSON Array com a lista de e-mails. */
    JSONObject json = new JSONObject ();
    JSONArray listaEmails = new JSONArray();
    listaEmails.put("email_01@focusnfe.com.br");
    listaEmails.put("email_02@focusnfe.com.br");
    listaEmails.put("email_03@focusnfe.com.br");
    json.put("emails", listaEmails);

    /* Testar se o JSON gerado está dentro do formato esperado.
    System.out.print(json); */

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int httpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

    /* As três linhas abaixo imprimem as informações retornadas pela API.
     * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(httpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# referência da nota - deve ser única para cada nota enviada
ref = "id_referencia_nota"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe/" + ref + "/email"

# altere os campos conforme a nota que será enviada
emails_destinatarios = {
  emails: ["email_01@focusnfe.com.br", "email_02@focusnfe.com.br", "email_03@focusnfe.com.br"]
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos os dados da nota para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = emails_destinatarios.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
  puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

// Substituir pela sua identificação interna da nota.
var ref = "12345";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe/" + ref + "/email";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var email = ["email1@focusnfe.com.br", "email2@focusnfe.com.br", "email3@focusnfe.com.br"];

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
var json = JSON.stringify({"emails": email});

request.send(json);

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe/"

# Substituir pela sua identificação interna da nota
ref = "12345"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
emails = {}
email = "suporte@focusnfe.com.br"
emails["emails"] = [email]

r = requests.delete(url+ref+"/email", data=json.dumps(emails), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Para cada nota autorizada, cancelada ou que tenha sido emitida uma carta de correção o destinatário da nota é notificado via email. Porém eventualmente pode ser necessário enviar a nota fiscal para outras pessoas ou mesmo reenviar o email para o mesmo destinatário.

Para enviar um ou mais emails:

`https://api.focusnfe.com.br/v2/nfe/REFERENCIA/email`

Utilize o comando **HTTP POST** para enviar os emails. Esta operação aceita apenas um parâmetro:

* **emails**: Array com uma lista de emails que deverão receber uma cópia da nota. Limitado a 10 emails por vez.

A API imediatamente devolve a requisição com a confirmação dos emails. Os emails serão enviados em segundo plano, por isso pode levar alguns minutos até que eles cheguem à caixa postal.

## Inutilização


```shell
curl -u "token obtido no cadastro da empresa:" \
  -X POST -d '{"cnpj":"51916585000125","serie":"1","numero_inicial":"7","numero_final":"9","justificativa":"Teste de inutilizacao de nota"}' \
  https://homologacao.focusnfe.com.br/v2/nfe/inutilizacao
```

```php
<?php
/* Você deve definir isso globalmente para sua aplicação.
Para ambiente de produção utilize e a variável abaixo:
$server = "https://api.focusnfe.com.br"; */
$server = "https://homologacao.focusnfe.com.br";
// Substituir a variável, ref, pela sua identificação interna de nota.
$login = "token obtido no cadastro da empresa";
$password = "";
$inutiliza = array (
  "cnpj" => "51916585000125",
  "serie" => "1",
  "numero_inicial" => "7",
  "numero_final" => "9",
  "justificativa" => "Teste de inutilizacao denota"
);
// Inicia o processo de envio das informações usando o cURL.
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $server."/v2/nfe/inutilizacao");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($inutiliza));
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_USERPWD, "$login:$password");
$body = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
// As próximas três linhas são um exemplo de como imprimir as informações de retorno da API.
print($http_code."\n");
print($body."\n\n");
print("");
curl_close($ch);
?>
```

```java
import java.util.HashMap;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;

public class NFeInutilizacao {

  public static void main(String[] args) throws JSONException{

    String login = "Token_obtido_no_cadastro_da_empresa";

    /* Para ambiente de produção use a variável abaixo:
    String server = "https://api.focusnfe.com.br/"; */
    String server = "https://homologacao.focusnfe.com.br/";

    String url = server.concat("v2/nfe/inutilizacao");

    /* Aqui criamos um hash que irá receber as chaves e valores esperados para gerar a inutilização. */
    HashMap<String, String> dadosInutilizacao = new HashMap<String, String>();
    dadosInutilizacao.put("cnpj", "51916585009999");
    dadosInutilizacao.put("serie", "9");
    dadosInutilizacao.put("numero_inicial", "7730");
    dadosInutilizacao.put("numero_final", "7732");
    dadosInutilizacao.put("justificativa", "Informe aqui a justificativa para realizar a inutilizacao da numeracao.");

    /* Criamos um objeto JSON que irá receber o input dos dados, para então enviar a requisição. */
    JSONObject json = new JSONObject (dadosInutilizacao);

    /* Testar se o JSON gerado está dentro do formato esperado.
    System.out.print(json); */

    /* Configuração para realizar o HTTP BasicAuth. */
    Object config = new DefaultClientConfig();
    Client client = Client.create((ClientConfig) config);
    client.addFilter(new HTTPBasicAuthFilter(login, ""));

    WebResource request = client.resource(url);

    ClientResponse resposta = request.post(ClientResponse.class, json);

    int hHttpCode = resposta.getStatus();

    String body = resposta.getEntity(String.class);

     /* As três linhas abaixo imprimem as informações retornadas pela API.
      * Aqui o seu sistema deverá interpretar e lidar com o retorno. */
    System.out.print("HTTP Code: ");
    System.out.print(hHttpCode);
    System.out.printf(body);
  }
}
```

```ruby

# encoding: UTF-8

require "net/http"
require "net/https"
require "json"

# token enviado pelo suporte
token = "codigo_alfanumerico_token"

# endereço da api que deve ser usado conforme o ambiente: produção ou homologação
servidor_producao = "https://api.focusnfe.com.br/"
servidor_homologacao = "https://homologacao.focusnfe.com.br/"

# no caso do ambiente de envio ser em produção, utilizar servidor_producao
url_envio = servidor_homologacao + "v2/nfe/inutilizacao"

# altere os campos conforme a nota que será enviada
dados_inutilizacao = {
  cnpj: "51916585009999",
  serie: "9",
  numero_inicial: "7730",
  numero_final: "7732",
  justificativa: "Informe aqui a justificativa para realizar a inutilizacao da numeracao."
}

# criamos um objeto uri para envio da nota
uri = URI(url_envio)

# também criamos um objeto da classe HTTP a partir do host da uri
http = Net::HTTP.new(uri.hostname, uri.port)

# aqui criamos um objeto da classe Post a partir da uri de requisição
requisicao = Net::HTTP::Post.new(uri.request_uri)

# adicionando o token à requisição
requisicao.basic_auth(token, '')

# convertemos a hash de justificativa do cancelamento para o formato JSON e adicionamos ao corpo da requisição
requisicao.body = dados_inutilizacao.to_json

# no envio de notas em produção, é necessário utilizar o protocolo ssl
# para isso, basta retirar o comentário da linha abaixo
# http.use_ssl = true

# aqui enviamos a requisição ao servidor e obtemos a resposta
resposta = http.request(requisicao)

# imprimindo o código HTTP da resposta
puts "Código retornado pela requisição: " + resposta.code

# imprimindo o corpo da resposta
puts "Corpo da resposta: " + resposta.body

```

```javascript

/*
As orientacoes a seguir foram extraidas do site do NPMJS: https://www.npmjs.com/package/xmlhttprequest
Here's how to include the module in your project and use as the browser-based XHR object.
Note: use the lowercase string "xmlhttprequest" in your require(). On case-sensitive systems (eg Linux) using uppercase letters won't work.
*/
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

var request = new XMLHttpRequest();

var token = "Token_obtido_no_cadastro_da_empresa";

/*
Para ambiente de producao use a URL abaixo:
"https://api.focusnfe.com.br"
*/
var url = "https://homologacao.focusnfe.com.br/v2/nfe/inutilizacao";

/*
Use o valor 'false', como terceiro parametro para que a requisicao aguarde a resposta da API
Passamos o token como quarto parametro deste metodo, como autenticador do HTTP Basic Authentication.
*/
request.open('POST', url, false, token);

var inutiliza = {
"cnpj": "51916585000125",
"serie": "1",
"numero_inicial": "700",
"numero_final": "703",
"justificativa": "Teste de inutilizacao de nota"
};

// Aqui fazermos a serializacao do JSON com os dados da nota e enviamos atraves do metodo usado.
request.send(JSON.stringify(inutiliza));

// Sua aplicacao tera que ser capaz de tratar as respostas da API.
console.log("HTTP code: " + request.status);
console.log("Corpo: " + request.responseText);

```

```python
# Faça o download e instalação da biblioteca requests, através do python-pip.
import json
import requests

'''
Para ambiente de produção use a variável abaixo:
url = "https://api.focusnfe.com.br"
'''
url = "https://homologacao.focusnfe.com.br/v2/nfe/inutilizacao"

token="token obtido no cadastro da empresa"

'''
Usamos um dicionario para armazenar os campos e valores que em seguida,
serao convertidos a JSON e enviados para nossa API
'''
inutilizacao={}
inutilizacao["cnpj"] = "CNPJ da empresa emitente"
inutilizacao["serie"] = "Serie da numeracao da NFCe que tera uma faixa de numeracao inutilizada"
inutilizacao["numero_inicial"] = "Numero inicial a ser inutilizado"
inutilizacao["numero_final"] = "Numero final a ser inutilizado"
inutilizacao["justificativa"] = "Justificativa da inutilizacao (minimo 15 caracteres)"

r = requests.post(url, data=json.dumps(inutilizacao), auth=(token,""))

# Mostra na tela o codigo HTTP da requisicao e a mensagem de retorno da API
print(r.status_code, r.text)
```

Em uma situação normal você não precisará informar ao SEFAZ a inutilização de um número da NFe, pois a API controla automaticamente a numeração das notas. Porém, se por alguma situação específica for necessário a inutilização de alguma faixa de números você poderá chamar as seguintes operações:

Envio de inutilização de faixa de numeração:

`https://api.focusnfe.com.br/v2/nfe/inutilizacao`

Utilize o comando **HTTP POST** para enviar a sua inutilização para nossa API. Este método é **síncrono**, ou seja, a comunicação com a SEFAZ será feita imediatamente e devolvida a resposta na mesma requisição.

A inutilização precisa dos seguintes parâmetros obrigatórios:

* **cnpj**: CNPJ da empresa emitente. (Segundo a NT 2018/001 esta operação não se aplica à emitente pessoa física)
* **serie**: Série da numeração da NFe que terá uma faixa de numeração inutilizada
* **numero_inicial**: Número inicial a ser inutilizado
* **numero_final**: Número final a ser inutilizado
* **justificativa**: Justificativa da inutilização (mínimo 15 caracteres)

A API irá enviar uma resposta com os seguintes campos:

* **status**: autorizado, se a inutilização foi aceita pela SEFAZ, ou erro_autorizacao, se houve algum erro ao inutilizar os números.
* **status_sefaz**: O status da inutilização na SEFAZ.
* **mensagem_sefaz**: Mensagem descritiva da SEFAZ detalhando o status.
* **serie**: Série da numeração da NFe que terá uma faixa de numeração inutilizada
* **numero_inicial**: Número inicial a ser inutilizado
* **numero_final**: Número final a ser inutilizado
* **cnpj:** CNPJ da empresa
* **modelo:** Modelo do documento (55 para NFe)
* **caminho_xml**: Caminho do XML para download caso a inutilização tenha sido autorizada pela SEFAZ.
* **protocolo_sefaz**: O número de protocolo da inutilização na SEFAZ.

Em algumas situações em que sejam identificados erros de emissão de forma tardia, nossa API pode decidir pela inutilização de números ao invés de reutilizá-los para outras emissões. Desta forma você pode criar um gatilho (webhook) para ser notificado sempre que houver a inutilização de alguma faixa de numeração. Consulte a [seção de gatilhos](https://focusnfe.com.br/doc/#gatilhos-webhooks_gatilhos-webhooks) e utilize o evento chamado "inutilizacao".


> Exemplos de respostas da API por status para a requisição de inutilização:

> autorizado

```json
{
  "status_sefaz": "102",
  "mensagem_sefaz": "Inutilizacao de numero homologado",
  "serie": "1",
  "numero_inicial": "999",
  "numero_final": "1000",
  "modelo": "55",
  "cnpj": "1807504505000130",
  "status": "autorizado",
  "caminho_xml": "/arquivos_development/07504505000132/201906/XMLs/190750450500013255001000000999000001000-inu.xml",
  "protocolo_sefaz": "135210002233889"
}
```

> erro_autorizacao

```json
{
  "status_sefaz": "256",
  "mensagem_sefaz": "Uma NF-e da faixa ja esta inutilizada na Base de dados da SEFAZ",
  "serie": "1",
  "numero_inicial": "1000",
  "numero_final": "1000",
  "status": "erro_autorizacao"
}
```

## Outras documentações
### Enviador de Arquivos

Uma das formas de se comunicar com o Focus NFe é gerando um arquivo texto no formato especificado.

Para sistemas desktop que não desejam implementar uma comunicação direta com nossos web services criamos um agente de comunicação que lê os arquivos gerados em uma pasta e envia para o Focus NFe. Em um segundo momento o próprio agente consulta o status da nota e faz o download dos arquivos do DANFe e XML da nota.

**Como Funciona**

Sempre que o comunicador é chamado ele irá seguir os passos abaixo:

1.  **Enviar os arquivos de NFe** que estão no diretório de envio e criar uma pendência de retorno para esta nota.
2.  **Enviar os arquivos de cancelamento** que estão no diretório de envio e criar uma pendência de retorno para este cancelamento.
3.  **Consultando os retornos pendentes**.
    1.  **Havendo retorno** o comunicador irá **gravar o arquivo de retorno** com o nome do identificador e a extensão (.ret). Por exemplo, para uma NFe com identificador único 99887766 será gravado o arquivo 99887766.ret no diretório de retorno.
    2. Se o retorno é referente a uma **emissão de NFe e esta nota foi autorizada**, o comunicador já irá fazer o download do **DANFe e do XML** gravando os dois arquivos em um subdiretório do diretório de retorno. Para o DANFe o nome do subdiretório será DANFEs e para o XML será XMLs.


**Envio do arquivo para emissão da NFe**

A aplicação do cliente deverá gravar um arquivo contendo o conteúdo da NFe e cujo nome é composto de um identificador único e com extensão NFe. Por exemplo, se o identificador único da nota no sistema cliente é 99887766 deverá ser gravado no diretório de envio com a extensão nfe, ou seja 99887766.nfe.

**Envio do arquivo para cancelamento de NFe**

A aplicação cliente deverá gravar um arquivo contendo um texto de justificativa de cancelamento. O arquivo deverá ser nomeado com o identificador único da nota e com extensão (.can). Em nosso exemplo acima o nome do arquivo seria 99887766.can. Este arquivo deverá ser gravado no diretório de envio de dados.

**Envio do carta de correção eletrônica (CCe)**

A aplicação cliente deverá gravar um arquivo contendo um texto da correção a ser aplicada. O arquivo deverá ser nomeado com o identificador único da nota e com extensão (.cce) e gravar no diretório de envio de dados.

O PDF e XML da carta de correção serão gravados no diretório de retorno, subdiretório CCes.

**Reconsulta de nfe**

O comunicador faz adiciona pendências de consulta automaticamente para todo envio e cancelamento comandado. Se por algum motivo houver a necessidade de comandar novamente uma consulta, basta acionar o comunicador com o parâmetro ref e o valor sendo o id único da nota. Por exemplo, para comandar a reconsulta da nota com id único 99887766 basta chamar o comunicador como na linha de comando a seguir:

`$ focusNFeFileCommunicator ref=99887766`

**Importante**

O comunicador possui uma execução linear e ao final é desativado. Isto quer dizer que ele não repete as consultas até que as notas estejam em estado final. É de responsabilidade da aplicação do cliente chamar o comunicador de tempos em tempos até que tenha as respostas para seus envios.

**Configuração**

Após rodar o comunicador pela primeira vez ele irá gerar um arquivo de configuração com informações padrão, como no exemplo ao lado.

<pre>
[Diretorios]
envio =P:envios
retorno =P:retornos
logs=P:logs
[Conexao]
url =https://api.focusnfe.com.br/
token={token-enviado-pelo-suporte-focusnfe}
</pre>

Na seção **Diretorios** são configurados os diretórios de comunicação (envio e retorno) onde a aplicação do cliente irá salvar e ler arquivos respectivamente. Também é configurado o diretório de logs, onde o comunicador irá gravar os logs das operações realizadas por ele.

A seção **Conexão** possui duas configurações cruciais para a correta comunicação com o Focus NFe. A url determina o endereço de comunicação que pode ser o de homologação (https://homologacao.focusnfe.com.br) e produção (https://api.focusnfe.com.br).

O token é a chave de acesso, fornecida pelo suporte, que irá garantir que a aplicação do cliente tem acesso ao Focus NFe.

**Download**

O comunicador foi desenvolvido para uso em sistema operacional Windows, para fazer o download do comunicador [clique aqui](http://www.focusnfe.com.br/downloads/focusNfeFileCommunicator.exe) .

## Importação

Para importar uma NFe a partir de seu XML utilize a URL abaixo, alterando o ambiente de produção para homologação, caso esteja importando notas de teste.

Importação do XML de uma NFe:

`https://api.focusnfe.com.br/v2/nfe/importacao?ref=REFERENCIA`

Utilize o comando **HTTP POST** para importar a sua nota para nossa API. Envie como corpo do POST o conteúdo do arquivo XML. O campo de referência (ref) pode ser omitido, neste caso iremos considerar o valor da chave da nota.

Na importação é feita apenas a validação da empresa emitente, esta empresa deve estar cadastrada previamente para aceitar as importações. Não há necessidade de ter um
certificado digital instalado para aceitar a importação.

Caso a nota seja validada corretamente, a nota será importada e estará disponível para
receber outras operações como cancelamento ou carta de correção. Para realizar estas operações será necessário que a empresa tenha um certificado digital.

Os dados devolvidos após a importação com sucesso são os mesmos da operação de
[consulta](#nfe_consulta)

> Exemplos de respostas da API

> Importação realizada com sucesso

```json
{
  "cnpj_emitente": "07504505000132",
  "ref": "NFe41190607504505000132550010000000221923094166",
  "status": "autorizado",
  "status_sefaz": "100",
  "mensagem_sefaz": "Autorizado o uso da NF-e",
  "chave_nfe": "NFe41190607504505000132550010000000221923094166",
  "numero": "22",
  "serie": "1",
  "caminho_xml_nota_fiscal": "/arquivos_development/07504505000132/201906/XMLs/41190607504505000132550010000000221923094166-nfe.xml",
  "caminho_danfe": "/arquivos_development/07504505000132/201906/DANFEs/41190607504505000132550010000000221923094166.pdf"
}
```

> Erro na validação do XML

```json
{
  "codigo": "erro_validacao_xml",
  "mensagem": "O XML não pode ser interpretado, verifique seu conteúdo e tente novamente"
}
```

```shell
# arquivo.xml deve conter o XML da NFe
curl -u "token obtido no cadastro da empresa:" \
  -X POST -T arquivo.xml https://homologacao.focusnfe.com.br/v2/nfe/importacao
```

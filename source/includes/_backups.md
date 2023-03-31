# Backups (NFe, NFCe e CTe)

Atualmente, realizamos o backup de todos os arquivos XML’s das notas fiscais emitidas pela nossa API. Vale lembrar que o XML é um arquivo com validade legal e deve ser armazenado pelos emitentes, para fins fiscais, por no mínimo 5 anos após a emissão.

Mensalmente a API gera um arquivo compactado em formato ZIP com todos os arquivos gerados de cada empresa.

A consulta dos arquivos de backup pode ser feito com a URL abaixo:

`https://api.focusnfe.com.br/v2/backups/CNPJ.json`

Utilize o comando HTTP GET para consultar o seu backup em nossa API.

Onde CNPJ é o CNPJ da empresa a ser consultada. Está requisição irá devolver um objeto com os seguintes atributos:

* <strong>backups</strong>: Array de objetos contendo:
   * <strong>mes</strong>: Mês do backup no formato AAAAMM”, ex: “201701”
   * <strong>danfes</strong>: Caminho para baixar arquivo ZIP com as DANFEs geradas (NFe)
   * <strong>xmls</strong>: Caminho para baixar arquivo ZIP com os XMLs gerados (NFe e NFCe)

Os backups serão mantidos por 6 meses em nossos servidores.

## Momentos de geração e cuidados necessários

O backup é gerado no primeiro dia de cada mês e uma parcial do arquivo é gerado todo sábado com as notas emitidas até então.

Para fins de apuração de imposto, recomendamos que a contabilidade responsável valide as notas recebidas, pois algumas exceções podem ocorrer, por exemplo:

* Podem ocorrer emissões de notas com datas retroativas mas posteriores ao download do XML. Neste caso o arquivo será atualizado semanalmente aos sábados.
* É possível que notas tenham sido emitidas usando outros sistemas, então não podemos garantir que todas as notas da empresa estejam presentes.
* Deverá ser considerado o tempo de geração do arquivo, pois dependendo do volume de notas o arquivo pode ficar disponível apenas ao final do dia primeiro. Recomendamos que o download dos arquivos seja feita apenas a partir do dia 2 de cada mês.

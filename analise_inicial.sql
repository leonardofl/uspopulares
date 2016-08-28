
-- Resultados calculados com dados obtidos em 27/08/16

-- quantidade de publicações
> select count(*) from api_publicacao;
60930

> select min(ano_publicacao) from api_publicacao;
200

> select url from api_publicacao where ano_publicacao=200;
http://www.teses.usp.br/teses/disponiveis/91/91131/tde-07032008-160949/pt-br.php
-- opa, erro nos dados... esse cara é de 2008

> select distinct ano_publicacao from api_publicacao order by ano_publicacao limit 2;
200
1972
-- temos teses desde 1972

-- as 10 teses mais baixadas
> select tipo, ano_publicacao, titulo, autor, unidade, area_conhecimento, downloads from api_publicacao order by downloads desc limit 10;
TESE_DOUTORADO|1999|Um modelo para planejamento de canais de distribuição no setor de alimentos.|Marcos Fava Neves|FEA|Finanças e Marketing|117003
DISSERTACAO_MESTRADO|2002|Planejamento estratégico como ferramenta de competitividade na pequena empresa: desenvolvimento e avaliação de um roteiro prático para o processo de elaboração do planejamento|Ana Cláudia Fernandes Terence|EESC|Engenharia de Produção|111719
DISSERTACAO_MESTRADO|2004|Contratos psicológicos como fatores influenciadores dos índices de rotatividade voluntária em empresas de consultoria|Letícia Fantinato Menegon|FEA|Administração|91826
TESE_DOUTORADO|2007|Gestão com pessoas - gestão, comunicação e pessoas: comunicação como competência de apoio para a gestão alcançar resultados humanos|Isabel Macarenco|ECA|Interfaces Sociais da Comunicação|89862
DISSERTACAO_MESTRADO|2002|Avaliação da qualidade microbiológica de alimentos com a utilização de metodologias convencionais e do sistema simplate.|Maria Cecília da Silva|ESALQ|Ciência e Tecnologia de Alimentos|78233
DISSERTACAO_MESTRADO|2003|Decisão estratégica em TI: estudo de caso. |Milton Murakami|FEA|Administração|76326
TESE_DOUTORADO|2009|Responsabilidade social das empresas: formações discursivas em confronto|Ricardo Zagallo Camargo|ECA|Interfaces Sociais da Comunicação|75854
DISSERTACAO_MESTRADO|2002|O uso da internet como ferramenta para a oferta diferenciada de serviços a clientes corporativos: um estudo exploratório no setor de telecomunicações |Lucia de Fátima Martins Guilhoto|FEA|Administração|75175
DISSERTACAO_MESTRADO|2000|Sistemas integrados de gestão empresarial: estudos de casos de implementação de sistemas ERP.|Cesar Alexandre de Souza|FEA|Métodos Quantitativos|71798
DISSERTACAO_MESTRADO|2002|Investigações sobre o acabamento superficial de usinagens com altíssima velocidade de corte. |Ian Faccio|Poli|Engenharia Mecânica|52972

-- downloads por unidade (as 20 mais)
> select unidade, sum(downloads) as soma from api_publicacao group by unidade order by soma desc limit 20;
FFLCH|8725881
Poli|7191673
ESALQ|6483583
FM|5792027
EESC|5175546
FEA|4492746
FE|2900001
EERP|2791564
FD|2388257
ECA|2075113
IP|1939234
FSP|1778276
FAU|1662908
FOB|1604549
FMVZ|1539708
FCF|1422442
FO|1356940
EE|1335888
FFCLRP|1291227
IB|1215200

-- downloads por área de conhecimento (as 20 mais)
> select area_conhecimento, sum(downloads) as soma from api_publicacao group by area_conhecimento order by soma desc limit 20;
Educação|2838230
Administração|2691932
Engenharia de Produção|1657544
História Social|1544780
Enfermagem Fundamental|1400265
Geografia Humana|1074930
Controladoria e Contabilidade: Contabilidade|1049070
Enfermagem em Saúde Pública|858377
Engenharia de Construção Civil e Urbana|831543
Ciência e Tecnologia de Alimentos|784505
Economia Aplicada|732001
Ciência Animal e Pastagens|670642
Psicologia Escolar e do Desenvolvimento Humano|670068
Sistemas de Potência|652308
Fitotecnia|620826
Psicologia|619338
Recursos Florestais|616378
Fisiopatologia Experimental|601820
Enfermagem Psiquiátrica|594602
Ciências de Computação e Matemática Computacional|586520

-- downloads por área de conhecimento / unidade (as 20 mais)
> select area_conhecimento, unidade, sum(downloads) as soma from api_publicacao group by area_conhecimento, unidade order by soma desc limit 20;
Educação|FE|2828899
Administração|FEA|2691932
História Social|FFLCH|1544780
Enfermagem Fundamental|EERP|1400265
Geografia Humana|FFLCH|1074930
Controladoria e Contabilidade: Contabilidade|FEA|1049070
Engenharia de Produção|EESC|873706
Enfermagem em Saúde Pública|EERP|858377
Engenharia de Construção Civil e Urbana|Poli|831543
Ciência e Tecnologia de Alimentos|ESALQ|784505
Engenharia de Produção|Poli|783838
Ciência Animal e Pastagens|ESALQ|670642
Psicologia Escolar e do Desenvolvimento Humano|IP|670068
Economia Aplicada|ESALQ|652998
Sistemas de Potência|Poli|652308
Fitotecnia|ESALQ|620826
Psicologia|FFCLRP|619338
Recursos Florestais|ESALQ|616378
Fisiopatologia Experimental|FM|601820
Ciências de Computação e Matemática Computacional|ICMC|586520


-- os 20 mais da ciência da computação do IME
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'IME' and area_conhecimento = 'Ciência da Computação' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2011|Padrões de testes automatizados|Paulo Cheque Bernardo|Kon, Fabio|4392
DISSERTACAO_MESTRADO|2011|Teoria, métodos e aplicações de otimização multiobjetivo|Phillipe Rodrigues Sampaio|Birgin, Ernesto Julian Goldberg|4234
DISSERTACAO_MESTRADO|2008|Experiências com desenvolvimento ágil|Dairton Luiz Bassi Filho|Colli, Eduardo|3992
DISSERTACAO_MESTRADO|2001|Integração do serviço de diretório LDAP com o serviço de nomes CORBA.|Gustavo Scalco Isquierdo|Reverbel, Francisco Carlos da Rocha|3222
DISSERTACAO_MESTRADO|2007|Uso eficaz de métricas em métodos ágeis de desenvolvimento de software|Danilo Toshiaki Sato|Lejbman, Alfredo Goldman Vel|2995
DISSERTACAO_MESTRADO|2011|Um estudo sistemático de licenças de software livre|Vanessa Cristina Sabino|Kon, Fabio|2940
DISSERTACAO_MESTRADO|2013|Consulta a ontologias utilizando linguagem natural controlada|Fabiano Ferreira Luz|Wassermann, Renata|2687
DISSERTACAO_MESTRADO|2012|Como a prática de TDD influencia o projeto de classes em sistemas orientados a objetos|Mauricio Finavaro Aniche|Gerosa, Marco Aurélio|2659
DISSERTACAO_MESTRADO|2001|Técnicas de seleção de características com aplicações em reconhecimento de faces.|Teófilo Emídio de Campos|Cesar Junior, Roberto Marcondes|2300
DISSERTACAO_MESTRADO|2008|Uma ferramenta para o ensino de inteligência artificial usando jogos de computador|Filipe Correa Lima da Silva|Silva, Flavio Soares Correa da|1931
DISSERTACAO_MESTRADO|2012|Aplicação de práticas de usabilidade ágil em software livre|Ana Paula Oliveira dos Santos|Kon, Fabio|1917
DISSERTACAO_MESTRADO|2008|Fluxo de dados em redes de Petri coloridas e em grafos orientados a atores|Grace Anne Pontes Borges|Ferreira, João Eduardo|1631
DISSERTACAO_MESTRADO|2011|Reconhecimento de fala para navegação em aplicativos móveis para português brasileiro|Edwin Miguel Triana Gomez|Kon, Fabio|1596
DISSERTACAO_MESTRADO|2013|Kalibro: interpretação de métricas de código-fonte|Carlos Morais de Oliveira Filho|Kon, Fabio|1588
DISSERTACAO_MESTRADO|2000|Ferramentas de auxílio ao seqüenciamento de DNA por montagem de fragmentos: um estudo comparativo.|Said Sadique Adi|Ferreira, Carlos Eduardo|1563
DISSERTACAO_MESTRADO|2008|Aplicações de computação paralela em otimização contínua|Ricardo Luiz de Andrade Abrantes|Birgin, Ernesto Julian Goldberg|1519
DISSERTACAO_MESTRADO|2013|Proposta de aprimoramento para o protocolo de assinatura digital Quartz|Ewerton Rodrigues Andrade|Terada, Routo|1495
DISSERTACAO_MESTRADO|2009|Aplicação de práticas ágeis na construção de data warehouse evolutivo|Guilherme Tozo de Carvalho|Ferreira, João Eduardo|1482
DISSERTACAO_MESTRADO|2006|Padrões de Fluxos de Processos em Banco de Dados Relacionais|Kelly Rosa Braghetto|Ferreira, Joao Eduardo|1455
DISSERTACAO_MESTRADO|2004|Serviços de pertinência para clusters de alta disponibilidade|Nelio Alves Pereira Filho|Mandel, Arnaldo|1451


-- downloads por orientador da ciência da computação do ime (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'IME' and area_conhecimento = 'Ciência da Computação' group by orientador order by soma desc limit 20;
Kon, Fabio|25703
Birgin, Ernesto Julian Goldberg|10188
Lejbman, Alfredo Goldman Vel|7809
Cesar Junior, Roberto Marcondes|7644
Terada, Routo|7092
Wassermann, Renata|6067
Reverbel, Francisco Carlos da Rocha|6019
Ferreira, Carlos Eduardo|5850
Gerosa, Marco Aurélio|5675
Ferreira, João Eduardo|5630
Barros, Leliane Nunes de|5392
Lago, Alair Pereira do|5034
Finger, Marcelo|4741
Silva, Flavio Soares Correa da|4622
Melo, Ana Cristina Vieira de|4416
Queiroz, Marcelo Gomes de|4151
Colli, Eduardo|3992
Brandao, Leonidas de Oliveira|2760
Ferreira, Joao Eduardo|2680
Hirata Junior, Roberto|2581

-- os 20 mais da engenharia de computação da Poli
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'Poli' and area_conhecimento = 'Engenharia de Computação' order by downloads desc limit 20;
TESE_DOUTORADO|2013|Planejamento integrado da cadeia de suprimentos da indústria do petróleo baseado em agentes holônicos.|Fernando José de Moura Marcellino|Sichman, Jaime Simão|2949
DISSERTACAO_MESTRADO|2013|Processo de pré-análise para a modelagem de distribuição de espécies.|Jorge Luiz Diaz Pinaya|Corrêa, Pedro Luiz Pizzigatti|506
TESE_DOUTORADO|2013|Qualidade da informação: uma abordagem orientada para o contexto.|Osmar Aparecido Machado|Almeida Junior, Jorge Rady de|409
TESE_DOUTORADO|2013|Método de multiplicação de baixa potência para criptosistema de chave-pública.|João Carlos Néto|Ruggiero, Wilson Vicente|318
DISSERTACAO_MESTRADO|2013|Aplicação das visões arquiteturais ODP na especificação e execução de processos de negócio.|Diego Mariano de Campos|Risco Becerra, Jorge Luís|315
DISSERTACAO_MESTRADO|2014|A security framework for mobile health data collection.|Leonardo Horn Iwaya|Carvalho, Tereza Cristina Melo de Brito|301
TESE_DOUTORADO|2013|Serviço de resolução e descoberta de informações sobre objetos em sistemas baseados em RFID.|Osvaldo Gogliano Sobrinho|Cugnasca, Carlos Eduardo|258
TESE_DOUTORADO|2013|Um processo de desenvolvimento orientado a objetos com suporte à verificação formal de inconsistências.|Thiago Carvalho de Sousa|Silva, Paulo Sérgio Muniz|234
TESE_DOUTORADO|2013|Pesquisa de similaridades em imagens mamográficas com base na extração de características.|Jamilson Bispo dos Santos|Almeida Junior, Jorge Rady de|222
DISSERTACAO_MESTRADO|2013|REASoN - avaliação de confiabilidade e disponibilidade em redes de computadores sustentáveis.|Marcelo Carneiro do Amaral|Carvalho, Tereza Cristina Melo de Brito|207
TESE_DOUTORADO|2013|Catálogo de modelos de computação para o desenvolvimento de linguagens específicas de modelagem de domínio.|Sergio Martins Fernandes|Melnikoff, Selma Shin Shimizu|204
TESE_DOUTORADO|2013|Algoritmo distribuído para alocação de múltiplos recursos em ambientes distribuídos.|Francisco Ribacionka|Sato, Liria Matsumoto|199
TESE_DOUTORADO|2013|Protocolo de roteamento de dados para redes de sensores sem fio com nó coletor móvel para controle da deriva em pulverização agrícola.|Ivairton Monteiro Santos|Cugnasca, Carlos Eduardo|190
TESE_DOUTORADO|2014|Uma metodologia para caracterização de aplicações e de instâncias de máquinas virtuais no ambiente de computação em nuvem.|Charles Boulhosa Rodamilans|Midorikawa, Edson Toshimi|160
TESE_DOUTORADO|2013|Avaliação do uso da rede de telecomunicações aeronáuticas  (ATN) para comunicação digital na operação de veículos aéreos não tripulados (VANT).|Magali Andréia Rossi|Almeida Junior, Jorge Rady de|157
TESE_DOUTORADO|2014|Redução de gastos com energia elétrica em sistemas de distribuição de água utilizando processos decisórios de Markov.|Paulo Thiago Fracasso|Reali Costa, Anna Helena|156
DISSERTACAO_MESTRADO|2014|Proposta de arquitetura e solução de gerenciamento de credenciais para autenticação e autorização em ambientes de computação em nuvem.|Nelson Mimura Gonzalez|Carvalho, Tereza Cristina Melo de Brito|155
TESE_DOUTORADO|2014|Um método para avaliar a aquisição de conhecimento em ambientes virtuais de aprendizagem tridimensionais interativos.|Eunice Pereira dos Santos Nunes|Marques, Fátima de Lourdes dos Santos Nunes|141
DISSERTACAO_MESTRADO|2014|Modelo de predição de falhas baseado em processos estocásticos e filtragem Kalman para suporte à manutenção preditiva de sistemas elétricos, eletrônicos e programáveis.|Antonio Vieira da Silva Neto|Cugnasca, Paulo Sergio|141
TESE_DOUTORADO|2014|Aceitação de tecnologia por estudantes surdos na perspectiva da educação inclusiva|Soraia Silva Prietch|Filgueiras, Lucia Vilela Leite|134


-- downloads por orientador da engenharia de computação da Poli (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'Poli' and area_conhecimento = 'Engenharia de Computação' group by orientador order by soma desc limit 20;
Sichman, Jaime Simão|3069
Almeida Junior, Jorge Rady de|908
Carvalho, Tereza Cristina Melo de Brito|849
Corrêa, Pedro Luiz Pizzigatti|635
Cugnasca, Carlos Eduardo|558
Sato, Liria Matsumoto|411
Ruggiero, Wilson Vicente|408
Risco Becerra, Jorge Luís|387
Filgueiras, Lucia Vilela Leite|337
Tori, Romero|256
Silva, Paulo Sérgio Muniz|234
Bressan, Graça|225
Reali Costa, Anna Helena|223
Marques, Fátima de Lourdes dos Santos Nunes|207
Melnikoff, Selma Shin Shimizu|204
Simplicio Junior, Marcos Antonio|164
Midorikawa, Edson Toshimi|160
Margi, Cíntia Borges|157
Saraiva, Antonio Mauro|157
Cugnasca, Paulo Sergio|147

-- downloads por orientador da Poli (os 20 mais)
> select orientador, area_conhecimento, sum(downloads) as soma from api_publicacao where unidade = 'Poli' group by orientador order by soma desc limit 20;
Botter, Rui Carlos|Engenharia Naval e Oceânica|90069
Melhado, Silvio Burrattino|Engenharia de Construção Civil e Urbana|89323
Garcia, Claudio|Engenharia de Sistemas|81284
Cintra, Jorge Pimentel|Engenharia de Transportes|80474
Francischini, Paulino Graciano|Engenharia de Produção|73653
Cardoso, Francisco Ferreira|Inovação na Construção Civil|73274
Tamada, Kikuo|Engenharia Hidráulica|68433
Tenório, Jorge Alberto Soares|Engenharia Metalúrgica e de Materiais|65366
Brunstein, Israel|Engenharia de Produção|63558
Hespanhol, Ivanildo|Engenharia Hidráulica|62043
Saidel, Marco Antonio|Sistemas de Potência|58683
Yoshizaki, Hugo Tsugunobu Yoshida|Engenharia de Sistemas Logísticos|56283
Stipkovic Filho, Marco|Engenharia Mecânica|53939
Mierzwa, José Carlos|Engenharia Hidráulica|52197
John, Vanderley Moacyr|Engenharia de Construção Civil e Urbana|52032
Carvalho, Marly Monteiro de|Engenharia Naval e Oceânica|50699
Barros, Mercia Maria Semensato Bottura de|Inovação na Construção Civil|50255
Laurindo, Fernando José Barbin|Engenharia Automotiva|49240
Sanchez, Luis Enrique|Engenharia Mineral|48233
Bernucci, Liedi Légi Bariani|Engenharia de Transportes|48107


-- os 20 mais do jornalismo da ECA
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'ECA' and area_conhecimento = 'Jornalismo' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2006|"Programação neurolinguística: transformação e persuasão no metamodelo" |Regina Maria Azevedo|Nobrega, Maria do Socorro|38181
DISSERTACAO_MESTRADO|2006|"Weblog e jornalismo: os casos de no mínimo Weblog e observatório da imprensa (bloi)" |Artur Vasconcellos Araujo|Nobrega, Maria do Socorro|4787
DISSERTACAO_MESTRADO|2004|"Imprensa feminista brasileira pós-1974" |Elizabeth da Penha Cardoso|Kucinski, Bernardo|3570
DISSERTACAO_MESTRADO|2002|"Do artístico ao jornalístico: vida e morte de um Suplemento - Suplemento literário de O Estado de S. Paulo (1956 a 1974)" |Elizabeth de Souza Lorenzotti|Borin, Jair|3352
DISSERTACAO_MESTRADO|2002|A MTV no Brasil: a padronização da cultura na mídia eletrônica mundial.|Luiza Cristina Lusvarghi|Leal Filho, Laurindo|2401
TESE_DOUTORADO|2006|Falares: a oralidade como elemento construtor da grande-reportagem|Alex Criado|Lima, Edvaldo Pereira|2052
DISSERTACAO_MESTRADO|2005|A epifania digital dos chats - escritura e subjetivação cibercultural|Marco Toledo de Assis Bastos|Marcondes Filho, Ciro Juvenal Rodrigues|2022
TESE_DOUTORADO|2006|Fora da caixa - o processo de decisão sobre o sistema de TV digital no Brasil|Renato Bueno da Cruz|Santoro, Luiz Fernando|2014
DISSERTACAO_MESTRADO|2006|Discursos e efeitos evanescentes: Uma leitura da imprensa sobre o consumo de substâncias psicoativas na sociedade brasileira|José Ricardo Gallina|Freitas, Jeanne Marie Machado de|1992
DISSERTACAO_MESTRADO|2005|"O olhar superficial: as transformações no jornalismo cultural em São Paulo na passagem para o século XXI" |Marcelo Januario|Vallada, Kardec Pinto|1920
TESE_DOUTORADO|2005|"Jornalismo e políticas públicas. A imprensa de São Paulo esclarece a dinâmica da participação política quando cobre o discurso e a ação pública?" (1994-2004) |Ana Maria de Abreu Laurenza|Matos, Heloiza Helena Gomes de|1758
DISSERTACAO_MESTRADO|2005|"A solidão da América Latina na grande imprensa brasileira" |Alexandre Barbosa|Ramadan, Nancy Nuyen Ali|1555
TESE_DOUTORADO|2006|Semiótica minuta - especulações sobre a gramática dos signos e da comunicação a partir da obra de Charles S. Peirce|Anderson Vinícius Romanini|Buitoni, Dulcilia Helena Schroeder|1487
DISSERTACAO_MESTRADO|2005|"O uso do potencial expressivo da nova mídia pelos bancos de varejo: estudo de três casos" |Martin Jayo|Melly, Mylene|1292
TESE_DOUTORADO|2006|A televisão pública num ambiente de competição comercial. Estudo dos modelos brasileiro e português|Liana Vidigal Rocha|Leal Filho, Laurindo|1001
DISSERTACAO_MESTRADO|2006|Viagem ao outro: um estudo sobre o encontro entre jornalistas e fontes|Denise Casatti|Lima, Edvaldo Pereira|789
DISSERTACAO_MESTRADO|2006|"Super-Heróis da Ebal - A publicação nacional dos personagens dos 'comic books' dos EUA pela Editora Brasil-América (EBAL), década de 1960 e 70"|Rodrigo Nathaniel Arco e Flexa|Buitoni, Dulcilia Helena Schroeder|748
DISSERTACAO_MESTRADO|2005|"Da Conversa na Praça ao Via Satélite - A Busca por Informação Agropecuária" |Ana Paula da Silva|Ceschin, Osvaldo Humberto Leonardi|400
TESE_DOUTORADO|2006|Jornalismo em rede digital: a construção do conhecimento mobilizada pela notícia|Edson Costa|Lopes, Dirceu Fernandes|365

-- downloads por orientador do jornalismo da ECA (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'ECA' and area_conhecimento = 'Jornalismo' group by orientador order by soma desc limit 20;
Nobrega, Maria do Socorro|42968
Kucinski, Bernardo|3570
Leal Filho, Laurindo|3402
Borin, Jair|3352
Lima, Edvaldo Pereira|2841
Buitoni, Dulcilia Helena Schroeder|2235
Marcondes Filho, Ciro Juvenal Rodrigues|2022
Santoro, Luiz Fernando|2014
Freitas, Jeanne Marie Machado de|1992
Vallada, Kardec Pinto|1920
Matos, Heloiza Helena Gomes de|1758
Ramadan, Nancy Nuyen Ali|1555
Melly, Mylene|1292
Ceschin, Osvaldo Humberto Leonardi|400
Lopes, Dirceu Fernandes|365


-- total de publicações por unidade (os 30 mais)
> select unidade, count(*) as qtd from api_publicacao group by unidade order by qtd desc limit 30;
FFLCH|6101
FM|4897
Poli|4089
ESALQ|3999
EESC|3704
FEA|1691
ECA|1538
FE|1491
ICB|1427
IP|1398
FD|1381
EERP|1348
FSP|1304
Instituto de Pesquisas Energéticas e Nucleares|1284
FOB|1269
FFCLRP|1254
IF|1249
ICMC|1234
FO|1212
FCF|1200
IQ|1199
IB|1166
IGc|1163
FMVZ|1069
FAU|1064
IFSC|1011
FMRP|967
EE|913
IQSC|781
FCFRP|752


-- ranking de impacto (downloads/publicação) os 20 mais
> select unidade, sum(downloads) / count(*) as impacto from api_publicacao group by unidade order by impacto desc limit 20;
FEA|2656
Enfermagem|2418
EERP|2070
FE|1945
Bioengenharia|1910
Poli|1758
FD|1729
EEFE|1635
ESALQ|1621
FAU|1562
EE|1463
FMVZ|1440
FFLCH|1430
EESC|1397
IP|1387
FSP|1363
ECA|1349
Ecologia de Agroecossistemas|1337
Nutrição Humana Aplicada|1330
FOB|1264


-- ranking de impacto (downloads/publicação) da computação
> select area_conhecimento, unidade, sum(downloads) / count(*) as impacto from api_publicacao where area_conhecimento like '%Computação%'  group by unidade order by impacto desc;
Ciências de Computação e Matemática Computacional|ICMC|623
Ciência da Computação|IME|491
Engenharia de Computação|Poli|116

-- os 20 mais da história (econômica e social) da FFLCH
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'FFLCH' and area_conhecimento like '%História%' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2002|Tipologia documental como parâmetro para gestão de documentos de arquivo: um manual para o município de Campo Belo (MG).|Ana Celia Rodrigues|Bellotto, Heloisa Liberalli|29037
TESE_DOUTORADO|2006|A conquista e a  ocupação da Amazônia brasileira no período colonial: a definição das fronteiras|Tadeu Valdir Freitas de Rezende|Wright, Antonia Fernanda Pacca de Almeida|24616
DISSERTACAO_MESTRADO|2001|A emigração espanhola e a trajetória do imigrante na cafeicultura paulista: o caso de Villa Novaes, 1880-1930.|Marilia Dalva Klaumann Canovas|Marcilio, Maria Luiza|24280
TESE_DOUTORADO|2008|A produção teatral paulistana dos anos 1980: rabiscando com faca o chão da história: tempo de contar os prejuízos em percursão de andança|Alexandre Luiz Mate|Aquino, Maria Aparecida de|19954
DISSERTACAO_MESTRADO|2009|Dona Benta - Comer Bem: uma fonte para a história da alimentação (1940-2003)|Renata da Silva Simoes|Carneiro, Henrique Soares|18243
DISSERTACAO_MESTRADO|2001|"Sob o olhar da razão:  as religiões não católicas e as ciências humanas no Brasil (1900-2000)" |Marcos Alexandre Capellari|Glezer, Raquel|15553
DISSERTACAO_MESTRADO|2009|A política da escravidão no império do Brasil, 1826-1865|Tâmis Peixoto Parron|Marquese, Rafael de Bivar|13798
TESE_DOUTORADO|2012|A África por ela mesma: a perspectiva africana na História Geral da África (UNESCO)|Muryatan Santana Barbosa|Souza, Marina de Mello e|13449
TESE_DOUTORADO|2003|A formação do professor e o ensino de história. Espaços e dimensões de práticas eduacativas (Belo Horizonte, 1980/2003).|Cláudia Regina Fonseca Miguel Sapag Ricci|Silva, Marcos Antonio da|13341
DISSERTACAO_MESTRADO|2006|História, política e revolução em Eric Hobsbawm e François Furet|Priscila Gomes Correa|Florenzano, Modesto|12198
TESE_DOUTORADO|2007|Nazismo tropical? O partido Nazista no Brasil|Ana Maria Dietrich|Meihy, Jose Carlos Sebe Bom|11901
DISSERTACAO_MESTRADO|2000|Padre Vieira: sonhos proféticos, profecias oníricas. O tempo do Quinto Império nos sermões de Xavier Dormindo.|Luis Filipe Silverio Lima|Meihy, Jose Carlos Sebe Bom|11748
TESE_DOUTORADO|2008|A produção musical evangélica no Brasil|Érica de Campos Visentini da Luz|Camargo, Ana Maria de Almeida|11459
TESE_DOUTORADO|2006|O Instituto Cubano del Arte e Industria Cinematográficos (ICAIC) e a política cultural em Cuba (1959-1991)|Mariana Martins Villaça|Capelato, Maria Helena Rolim|10893
TESE_DOUTORADO|2002|A semear horizontes: leituras literárias na formação da infância, Argentina e Brasil (1915-1954).|Gabriela Pellegrino Soares|Prado, Maria Ligia Coelho|10845
TESE_DOUTORADO|2008|Imigrantes espanhóis em Santos, 1882-1920|Eliane Veiga Porta|Novais, Fernando Antonio|10124
TESE_DOUTORADO|2000|As esquinas perigosas da História: um estudo sobre a história dos conceitos de época, situação e crise revolucionária no debate marxista.|Valerio Arcary|Iokoi, Zilda Marcia Gricoli|10002
TESE_DOUTORADO|2010|A historiografia da música popular no Brasil (1971-1999)|Silvano Fernandes Baia|Eugênio, Marcos Francisco Napolitano de|9983
TESE_DOUTORADO|2002|Nem do morro, nem da cidade: as transformações do samba e a indústria cultural - 1920-1945.|José Adriano Fenerick|Moura, Esmeralda Blanco Bolsonaro de|9967
TESE_DOUTORADO|2002|Religião e hegemonia aristocrática na Península Ibérica (Séculos IV-VIII).|Mario Jorge da Motta Bastos|Franco Junior, Hilario|9781

-- downloads por orientador da história (socieal e econômica) da FFLCH (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'FFLCH' and area_conhecimento like '%História%' group by orientador order by soma desc limit 20;
Silva, Marcos Antonio da|82409
Meihy, Jose Carlos Sebe Bom|62647
Glezer, Raquel|57071
Bellotto, Heloisa Liberalli|56043
Iokoi, Zilda Marcia Gricoli|52525
Marcilio, Maria Luiza|51089
Capelato, Maria Helena Rolim|47439
Aquino, Maria Aparecida de|46256
Moura, Esmeralda Blanco Bolsonaro de|41481
Souza, Marina de Mello e|40591
Camargo, Ana Maria de Almeida|39550
Souza, Laura de Mello e|38541
Carneiro, Henrique Soares|34194
Ferlini, Vera Lucia Amaral|32904
Machado, Maria Helena Pereira Toledo|32207
Hernandez, Leila Maria Gonçalves Leite|32185
Barbosa, Wilson do Nascimento|31778
Wright, Antonia Fernanda Pacca de Almeida|31769
Marquese, Rafael de Bivar|30523
Guarinello, Norberto Luiz|30382






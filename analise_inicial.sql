
-- Resultados calculados com dados obtidos em 19/07/16

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
TESE_DOUTORADO|1999|Um modelo para planejamento de canais de distribuição no setor de alimentos.|Marcos Fava Neves|FEA|Finanças e Marketing|115864
DISSERTACAO_MESTRADO|2002|Planejamento estratégico como ferramenta de competitividade na pequena empresa: desenvolvimento e avaliação de um roteiro prático para o processo de elaboração do planejamento|Ana Cláudia Fernandes Terence|EESC|Engenharia de Produção|109988
DISSERTACAO_MESTRADO|2004|Contratos psicológicos como fatores influenciadores dos índices de rotatividade voluntária em empresas de consultoria|Letícia Fantinato Menegon|FEA|Administração|89897
TESE_DOUTORADO|2007|Gestão com pessoas - gestão, comunicação e pessoas: comunicação como competência de apoio para a gestão alcançar resultados humanos|Isabel Macarenco|ECA|Interfaces Sociais da Comunicação|87788
DISSERTACAO_MESTRADO|2002|Avaliação da qualidade microbiológica de alimentos com a utilização de metodologias convencionais e do sistema simplate.|Maria Cecília da Silva|ESALQ|Ciência e Tecnologia de Alimentos|76834
DISSERTACAO_MESTRADO|2003|Decisão estratégica em TI: estudo de caso.|Milton Murakami|FEA|Administração|75737
TESE_DOUTORADO|2009|Responsabilidade social das empresas: formações discursivas em confronto|Ricardo Zagallo Camargo|ECA|Interfaces Sociais da Comunicação|74939
DISSERTACAO_MESTRADO|2002|O uso da internet como ferramenta para a oferta diferenciada de serviços a clientes corporativos: um estudo exploratório no setor de telecomunicações|Lucia de Fátima Martins Guilhoto|FEA|Administração|73978
DISSERTACAO_MESTRADO|2000|Sistemas integrados de gestão empresarial: estudos de casos de implementação de sistemas ERP.|Cesar Alexandre de Souza|FEA|Métodos Quantitativos|70998
DISSERTACAO_MESTRADO|2002|Investigações sobre o acabamento superficial de usinagens com altíssima velocidade de corte.|Ian Faccio|Poli|Engenharia Mecânica|52647

-- downloads por unidade (as 10 mais)
> select unidade, sum(downloads) as soma from api_publicacao group by unidade order by soma desc limit 10;
FFLCH       8619470   
Poli        7110150   
ESALQ       6422867   
FM          5714310   
EESC        5113156   
FEA         4456306   
FE          2864543   
EERP        2770173   
FD          2350424   
ECA         2045531  


-- downloads por área de conhecimento (as 10 mais)
> select area_conhecimento, sum(downloads) as soma from api_publicacao group by area_conhecimento order by soma desc limit 10;
Educação|2802918
Administração|2669566
Engenharia de Produção|1644753
História Social|1525254
Enfermagem Fundamental|1390188
Geografia Humana|1063195
Controladoria e Contabilidade: Contabilidade|1040972
Enfermagem em Saúde Pública|851422
Engenharia de Construção Civil e Urbana|823812
Ciência e Tecnologia de Alimentos|776899

-- os 20 mais da ciência da computação do IME
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'IME' and area_conhecimento = 'Ciência da Computação' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2011|Padrões de testes automatizados|Paulo Cheque Bernardo|Kon, Fabio|4323
DISSERTACAO_MESTRADO|2011|Teoria, métodos e aplicações de otimização multiobjetivo|Phillipe Rodrigues Sampaio|Birgin, Ernesto Julian Goldberg|4163
DISSERTACAO_MESTRADO|2008|Experiências com desenvolvimento ágil|Dairton Luiz Bassi Filho|Colli, Eduardo|3970
DISSERTACAO_MESTRADO|2001|Integração do serviço de diretório LDAP com o serviço de nomes CORBA.|Gustavo Scalco Isquierdo|Reverbel, Francisco Carlos da Rocha|3222
DISSERTACAO_MESTRADO|2007|Uso eficaz de métricas em métodos ágeis de desenvolvimento de software|Danilo Toshiaki Sato|Lejbman, Alfredo Goldman Vel|2961
DISSERTACAO_MESTRADO|2011|Um estudo sistemático de licenças de software livre|Vanessa Cristina Sabino|Kon, Fabio|2903
DISSERTACAO_MESTRADO|2012|Como a prática de TDD influencia o projeto de classes em sistemas orientados a objetos|Mauricio Finavaro Aniche|Gerosa, Marco Aurélio|2638
DISSERTACAO_MESTRADO|2013|Consulta a ontologias utilizando linguagem natural controlada|Fabiano Ferreira Luz|Wassermann, Renata|2627
DISSERTACAO_MESTRADO|2001|Técnicas de seleção de características com aplicações em reconhecimento de faces.|Teófilo Emídio de Campos|Cesar Junior, Roberto Marcondes|2297
DISSERTACAO_MESTRADO|2008|Uma ferramenta para o ensino de inteligência artificial usando jogos de computador|Filipe Correa Lima da Silva|Silva, Flavio Soares Correa da|1928
DISSERTACAO_MESTRADO|2012|Aplicação de práticas de usabilidade ágil em software livre|Ana Paula Oliveira dos Santos|Kon, Fabio|1878
DISSERTACAO_MESTRADO|2008|Fluxo de dados em redes de Petri coloridas e em grafos orientados a atores|Grace Anne Pontes Borges|Ferreira, João Eduardo|1614
DISSERTACAO_MESTRADO|2011|Reconhecimento de fala para navegação em aplicativos móveis para português brasileiro|Edwin Miguel Triana Gomez|Kon, Fabio|1585
DISSERTACAO_MESTRADO|2000|Ferramentas de auxílio ao seqüenciamento de DNA por montagem de fragmentos: um estudo comparativo.|Said Sadique Adi|Ferreira, Carlos Eduardo|1558
DISSERTACAO_MESTRADO|2013|Kalibro: interpretação de métricas de código-fonte|Carlos Morais de Oliveira Filho|Kon, Fabio|1544
DISSERTACAO_MESTRADO|2008|Aplicações de computação paralela em otimização contínua|Ricardo Luiz de Andrade Abrantes|Birgin, Ernesto Julian Goldberg|1509
DISSERTACAO_MESTRADO|2009|Aplicação de práticas ágeis na construção de data warehouse evolutivo|Guilherme Tozo de Carvalho|Ferreira, João Eduardo|1476
DISSERTACAO_MESTRADO|2013|Proposta de aprimoramento para o protocolo de assinatura digital Quartz|Ewerton Rodrigues Andrade|Terada, Routo|1463
DISSERTACAO_MESTRADO|2006|Padrões de Fluxos de Processos em Banco de Dados Relacionais|Kelly Rosa Braghetto|Ferreira, Joao Eduardo|1446
DISSERTACAO_MESTRADO|2004|Serviços de pertinência para clusters de alta disponibilidade|Nelio Alves Pereira Filho|Mandel, Arnaldo|1446

-- downloads por orientador da ciência da computação do ime (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'IME' and area_conhecimento = 'Ciência da Computação' group by orientador order by soma desc limit 20;
Kon, Fabio|25321
Birgin, Ernesto Julian Goldberg|10056
Lejbman, Alfredo Goldman Vel|7715
Cesar Junior, Roberto Marcondes|7565
Terada, Routo|7002
Reverbel, Francisco Carlos da Rocha|6010
Wassermann, Renata|5933
Ferreira, Carlos Eduardo|5784
Gerosa, Marco Aurélio|5563
Ferreira, João Eduardo|5558
Barros, Leliane Nunes de|5318
Lago, Alair Pereira do|4937
Finger, Marcelo|4663
Silva, Flavio Soares Correa da|4561
Melo, Ana Cristina Vieira de|4354
Queiroz, Marcelo Gomes de|4093
Colli, Eduardo|3970
Brandao, Leonidas de Oliveira|2732
Ferreira, Joao Eduardo|2665
Hirata Junior, Roberto|2522

-- os 20 mais da engenharia de computação da Poli
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'Poli' and area_conhecimento = 'Engenharia de Computação' order by downloads desc limit 20;
TESE_DOUTORADO|2013|Planejamento integrado da cadeia de suprimentos da indústria do petróleo baseado em agentes holônicos.|Fernando José de Moura Marcellino|Sichman, Jaime Simão|2905
DISSERTACAO_MESTRADO|2013|Processo de pré-análise para a modelagem de distribuição de espécies.|Jorge Luiz Diaz Pinaya|Corrêa, Pedro Luiz Pizzigatti|474
TESE_DOUTORADO|2013|Qualidade da informação: uma abordagem orientada para o contexto.|Osmar Aparecido Machado|Almeida Junior, Jorge Rady de|396
TESE_DOUTORADO|2013|Método de multiplicação de baixa potência para criptosistema de chave-pública.|João Carlos Néto|Ruggiero, Wilson Vicente|307
DISSERTACAO_MESTRADO|2013|Aplicação das visões arquiteturais ODP na especificação e execução de processos de negócio.|Diego Mariano de Campos|Risco Becerra, Jorge Luís|300
DISSERTACAO_MESTRADO|2014|A security framework for mobile health data collection.|Leonardo Horn Iwaya|Carvalho, Tereza Cristina Melo de Brito|284
TESE_DOUTORADO|2013|Serviço de resolução e descoberta de informações sobre objetos em sistemas baseados em RFID.|Osvaldo Gogliano Sobrinho|Cugnasca, Carlos Eduardo|252
TESE_DOUTORADO|2013|Um processo de desenvolvimento orientado a objetos com suporte à verificação formal de inconsistências.|Thiago Carvalho de Sousa|Silva, Paulo Sérgio Muniz|225
TESE_DOUTORADO|2013|Pesquisa de similaridades em imagens mamográficas com base na extração de características.|Jamilson Bispo dos Santos|Almeida Junior, Jorge Rady de|217
DISSERTACAO_MESTRADO|2013|REASoN - avaliação de confiabilidade e disponibilidade em redes de computadores sustentáveis.|Marcelo Carneiro do Amaral|Carvalho, Tereza Cristina Melo de Brito|200
TESE_DOUTORADO|2013|Catálogo de modelos de computação para o desenvolvimento de linguagens específicas de modelagem de domínio.|Sergio Martins Fernandes|Melnikoff, Selma Shin Shimizu|195
TESE_DOUTORADO|2013|Algoritmo distribuído para alocação de múltiplos recursos em ambientes distribuídos.|Francisco Ribacionka|Sato, Liria Matsumoto|190
TESE_DOUTORADO|2013|Protocolo de roteamento de dados para redes de sensores sem fio com nó coletor móvel para controle da deriva em pulverização agrícola.|Ivairton Monteiro Santos|Cugnasca, Carlos Eduardo|184
TESE_DOUTORADO|2014|Uma metodologia para caracterização de aplicações e de instâncias de máquinas virtuais no ambiente de computação em nuvem.|Charles Boulhosa Rodamilans|Midorikawa, Edson Toshimi|155
TESE_DOUTORADO|2014|Redução de gastos com energia elétrica em sistemas de distribuição de água utilizando processos decisórios de Markov.|Paulo Thiago Fracasso|Reali Costa, Anna Helena|149
TESE_DOUTORADO|2013|Avaliação do uso da rede de telecomunicações aeronáuticas  (ATN) para comunicação digital na operação de veículos aéreos não tripulados (VANT).|Magali Andréia Rossi|Almeida Junior, Jorge Rady de|147
DISSERTACAO_MESTRADO|2014|Proposta de arquitetura e solução de gerenciamento de credenciais para autenticação e autorização em ambientes de computação em nuvem.|Nelson Mimura Gonzalez|Carvalho, Tereza Cristina Melo de Brito|145
DISSERTACAO_MESTRADO|2014|Modelo de predição de falhas baseado em processos estocásticos e filtragem Kalman para suporte à manutenção preditiva de sistemas elétricos, eletrônicos e programáveis.|Antonio Vieira da Silva Neto|Cugnasca, Paulo Sergio|135
TESE_DOUTORADO|2014|Um método para avaliar a aquisição de conhecimento em ambientes virtuais de aprendizagem tridimensionais interativos.|Eunice Pereira dos Santos Nunes|Marques, Fátima de Lourdes dos Santos Nunes|132
TESE_DOUTORADO|2014|Aceitação de tecnologia por estudantes surdos na perspectiva da educação inclusiva|Soraia Silva Prietch|Filgueiras, Lucia Vilela Leite|124

-- downloads por orientador da engenharia de computação da Poli (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'Poli' and area_conhecimento = 'Engenharia de Computação' group by orientador order by soma desc limit 20;
Sichman, Jaime Simão|3013
Almeida Junior, Jorge Rady de|868
Carvalho, Tereza Cristina Melo de Brito|799
Corrêa, Pedro Luiz Pizzigatti|589
Cugnasca, Carlos Eduardo|539
Ruggiero, Wilson Vicente|392
Sato, Liria Matsumoto|389
Risco Becerra, Jorge Luís|370
Filgueiras, Lucia Vilela Leite|316
Tori, Romero|236
Silva, Paulo Sérgio Muniz|225
Bressan, Graça|212
Reali Costa, Anna Helena|209
Melnikoff, Selma Shin Shimizu|195
Marques, Fátima de Lourdes dos Santos Nunes|190
Midorikawa, Edson Toshimi|155
Saraiva, Antonio Mauro|148
Cugnasca, Paulo Sergio|135
Margi, Cíntia Borges|135
Simplicio Junior, Marcos Antonio|128

-- downloads por orientador da Poli (os 20 mais)
> select orientador, area_conhecimento, sum(downloads) as soma from api_publicacao where unidade = 'Poli' group by orientador order by soma desc limit 20;
Botter, Rui Carlos|Engenharia Naval e Oceânica|89605
Melhado, Silvio Burrattino|Engenharia de Construção Civil e Urbana|88818
Garcia, Claudio|Engenharia de Sistemas|79691
Cintra, Jorge Pimentel|Engenharia de Transportes|79543
Francischini, Paulino Graciano|Engenharia de Produção|72699
Cardoso, Francisco Ferreira|Inovação na Construção Civil|72489
Tamada, Kikuo|Engenharia Hidráulica|67752
Tenório, Jorge Alberto Soares|Engenharia Metalúrgica e de Materiais|64540
Brunstein, Israel|Engenharia de Produção|63100
Hespanhol, Ivanildo|Engenharia Hidráulica|61464
Saidel, Marco Antonio|Sistemas de Potência|58043
Yoshizaki, Hugo Tsugunobu Yoshida|Engenharia de Produção|55953
Stipkovic Filho, Marco|Engenharia Mecânica|53602
Mierzwa, José Carlos|Engenharia Hidráulica|51551
John, Vanderley Moacyr|Engenharia de Construção Civil e Urbana|51488
Carvalho, Marly Monteiro de|Engenharia Naval e Oceânica|50247
Barros, Mercia Maria Semensato Bottura de|Inovação na Construção Civil|49810
Laurindo, Fernando José Barbin|Engenharia de Produção|48879
Sanchez, Luis Enrique|Engenharia Mineral|47833
Chaves, Arthur Pinto|Engenharia Mineral|47564

-- os 20 mais do jornalismo da ECA
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'ECA' and area_conhecimento = 'Jornalismo' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2006||Regina Maria Azevedo|Nobrega, Maria do Socorro|37529
DISSERTACAO_MESTRADO|2006||Artur Vasconcellos Araujo|Nobrega, Maria do Socorro|4764
DISSERTACAO_MESTRADO|2004||Elizabeth da Penha Cardoso|Kucinski, Bernardo|3562
DISSERTACAO_MESTRADO|2002||Elizabeth de Souza Lorenzotti|Borin, Jair|3348
DISSERTACAO_MESTRADO|2002|A MTV no Brasil: a padronização da cultura na mídia eletrônica mundial.|Luiza Cristina Lusvarghi|Leal Filho, Laurindo|2381
TESE_DOUTORADO|2006|Falares: a oralidade como elemento construtor da grande-reportagem|Alex Criado|Lima, Edvaldo Pereira|2030
DISSERTACAO_MESTRADO|2005|A epifania digital dos chats - escritura e subjetivação cibercultural|Marco Toledo de Assis Bastos|Marcondes Filho, Ciro Juvenal Rodrigues|2003
TESE_DOUTORADO|2006|Fora da caixa - o processo de decisão sobre o sistema de TV digital no Brasil|Renato Bueno da Cruz|Santoro, Luiz Fernando|1993
DISSERTACAO_MESTRADO|2006|Discursos e efeitos evanescentes: Uma leitura da imprensa sobre o consumo de substâncias psicoativas na sociedade brasileira|José Ricardo Gallina|Freitas, Jeanne Marie Machado de|1980
DISSERTACAO_MESTRADO|2005||Marcelo Januario|Vallada, Kardec Pinto|1912
TESE_DOUTORADO|2005||Ana Maria de Abreu Laurenza|Matos, Heloiza Helena Gomes de|1757
DISSERTACAO_MESTRADO|2005||Alexandre Barbosa|Ramadan, Nancy Nuyen Ali|1551
TESE_DOUTORADO|2006|Semiótica minuta - especulações sobre a gramática dos signos e da comunicação a partir da obra de Charles S. Peirce|Anderson Vinícius Romanini|Buitoni, Dulcilia Helena Schroeder|1471
DISSERTACAO_MESTRADO|2005||Martin Jayo|Melly, Mylene|1292
TESE_DOUTORADO|2006|A televisão pública num ambiente de competição comercial. Estudo dos modelos brasileiro e português|Liana Vidigal Rocha|Leal Filho, Laurindo|991
DISSERTACAO_MESTRADO|2006|Viagem ao outro: um estudo sobre o encontro entre jornalistas e fontes|Denise Casatti|Lima, Edvaldo Pereira|784
DISSERTACAO_MESTRADO|2006||Rodrigo Nathaniel Arco e Flexa|Buitoni, Dulcilia Helena Schroeder|735
DISSERTACAO_MESTRADO|2005||Ana Paula da Silva|Ceschin, Osvaldo Humberto Leonardi|400
TESE_DOUTORADO|2006|Jornalismo em rede digital: a construção do conhecimento mobilizada pela notícia|Edson Costa|Lopes, Dirceu Fernandes|365
-- ops, o parser não pegou vários títulos. 
-- Gerada issue https://github.com/leonardofl/uspopulares/issues/3

-- downloads por orientador do jornalismo da ECA (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'ECA' and area_conhecimento = 'Jornalismo' group by orientador order by soma desc limit 20;
Nobrega, Maria do Socorro|42293
Kucinski, Bernardo|3562
Leal Filho, Laurindo|3372
Borin, Jair|3348
Lima, Edvaldo Pereira|2814
Buitoni, Dulcilia Helena Schroeder|2206
Marcondes Filho, Ciro Juvenal Rodrigues|2003
Santoro, Luiz Fernando|1993
Freitas, Jeanne Marie Machado de|1980
Vallada, Kardec Pinto|1912
Matos, Heloiza Helena Gomes de|1757
Ramadan, Nancy Nuyen Ali|1551
Melly, Mylene|1292
Ceschin, Osvaldo Humberto Leonardi|400
Lopes, Dirceu Fernandes|365

-- total de publicações por unidade (os 30 mais)
> select unidade, count(*) as qtd from api_publicacao group by unidade order by qtd desc limit 30;
FFLCH|6091
FM|4878
ESALQ|3963
Poli|3867
EESC|3654
FMVZ|1846
FEA|1675
ECA|1535
FE|1490
ICB|1427
IP|1398
FD|1373
EERP|1342
Instituto de Pesquisas Energéticas e Nucleares|1270
FOB|1259
FSP|1259
FFCLRP|1242
IF|1240
ICMC|1227
FO|1203
FCF|1190
IQ|1180
IGc|1161
IB|1155
FAU|1064
IFSC|1011
FMRP|967
EE|913
IQSC|774
FCFRP|739

-- ranking de impacto (downloads/publicação) os 20 mais
> select unidade, sum(downloads) / count(*) as impacto from api_publicacao group by unidade order by impacto desc limit 20;
FEA|2660
Enfermagem|2402
EERP|2064
FE|1922
Bioengenharia|1918
Poli|1838
FD|1711
ESALQ|1620
EEFE|1610
FAU|1541
EE|1447
FFLCH|1415
EESC|1399
FSP|1396
IP|1369
Ecologia de Agroecossistemas|1343
ECA|1332
Nutrição Humana Aplicada|1327
FOB|1262
Ciência Ambiental|1208

-- ranking de impacto (downloads/publicação) da computação
> select area_conhecimento, unidade, sum(downloads) / count(*) as impacto from api_publicacao where area_conhecimento like '%Computação%'  group by unidade order by impacto desc;
Ciências de Computação e Matemática Computacional|ICMC|619
Ciência da Computação|IME|487
Engenharia de Computação|Poli|144

-- os 20 mais da história (econômica e social) da FFLCH
> select tipo, ano_publicacao, titulo, autor, orientador, downloads from api_publicacao where unidade = 'FFLCH' and area_conhecimento like '%História%' order by downloads desc limit 20;
DISSERTACAO_MESTRADO|2002|Tipologia documental como parâmetro para gestão de documentos de arquivo: um manual para o município de Campo Belo (MG).|Ana Celia Rodrigues|Bellotto, Heloisa Liberalli|28919
TESE_DOUTORADO|2006|A conquista e a ocupação da Amazônia brasileira no período colonial: a definição das fronteiras|Tadeu Valdir Freitas de Rezende|Wright, Antonia Fernanda Pacca de Almeida|24443
DISSERTACAO_MESTRADO|2001|A emigração espanhola e a trajetória do imigrante na cafeicultura paulista: o caso de Villa Novaes, 1880-1930.|Marilia Dalva Klaumann Canovas|Marcilio, Maria Luiza|24233
TESE_DOUTORADO|2008|A produção teatral paulistana dos anos 1980: rabiscando com faca o chão da história: tempo de contar os prejuízos em percursão de andança|Alexandre Luiz Mate|Aquino, Maria Aparecida de|19737
DISSERTACAO_MESTRADO|2009|Dona Benta - Comer Bem: uma fonte para a história da alimentação (1940-2003)|Renata da Silva Simoes|Carneiro, Henrique Soares|18023
DISSERTACAO_MESTRADO|2001||Marcos Alexandre Capellari|Glezer, Raquel|15523
DISSERTACAO_MESTRADO|2009|A política da escravidão no império do Brasil, 1826-1865|Tâmis Peixoto Parron|Marquese, Rafael de Bivar|13650
TESE_DOUTORADO|2003|A formação do professor e o ensino de história. Espaços e dimensões de práticas eduacativas (Belo Horizonte, 1980/2003).|Cláudia Regina Fonseca Miguel Sapag Ricci|Silva, Marcos Antonio da|13239
TESE_DOUTORADO|2012|A África por ela mesma: a perspectiva africana na História Geral da África (UNESCO)|Muryatan Santana Barbosa|Souza, Marina de Mello e|13171
DISSERTACAO_MESTRADO|2006|História, política e revolução em Eric Hobsbawm e François Furet|Priscila Gomes Correa|Florenzano, Modesto|12112
TESE_DOUTORADO|2007|Nazismo tropical? O partido Nazista no Brasil|Ana Maria Dietrich|Meihy, Jose Carlos Sebe Bom|11827
DISSERTACAO_MESTRADO|2000|Padre Vieira: sonhos proféticos, profecias oníricas. O tempo do Quinto Império nos sermões de Xavier Dormindo.|Luis Filipe Silverio Lima|Meihy, Jose Carlos Sebe Bom|11723
TESE_DOUTORADO|2008|A produção musical evangélica no Brasil|Érica de Campos Visentini da Luz|Camargo, Ana Maria de Almeida|11129
TESE_DOUTORADO|2002|A semear horizontes: leituras literárias na formação da infância, Argentina e Brasil (1915-1954).|Gabriela Pellegrino Soares|Prado, Maria Ligia Coelho|10812
TESE_DOUTORADO|2006|O Instituto Cubano del Arte e Industria Cinematográficos (ICAIC) e a política cultural em Cuba (1959-1991)|Mariana Martins Villaça|Capelato, Maria Helena Rolim|10700
TESE_DOUTORADO|2008|Imigrantes espanhóis em Santos, 1882-1920|Eliane Veiga Porta|Novais, Fernando Antonio|10064
TESE_DOUTORADO|2000|As esquinas perigosas da História: um estudo sobre a história dos conceitos de época, situação e crise revolucionária no debate marxista.|Valerio Arcary|Iokoi, Zilda Marcia Gricoli|9965
TESE_DOUTORADO|2002|Nem do morro, nem da cidade: as transformações do samba e a indústria cultural - 1920-1945.|José Adriano Fenerick|Moura, Esmeralda Blanco Bolsonaro de|9939
TESE_DOUTORADO|2010|A historiografia da música popular no Brasil (1971-1999)|Silvano Fernandes Baia|Eugênio, Marcos Francisco Napolitano de|9844
TESE_DOUTORADO|2002|Religião e hegemonia aristocrática na Península Ibérica (Séculos IV-VIII).|Mario Jorge da Motta Bastos|Franco Junior, Hilario|9742

-- downloads por orientador da história (socieal e econômica) da FFLCH (os 20 mais)
> select orientador, sum(downloads) as soma from api_publicacao where unidade = 'FFLCH' and area_conhecimento like '%História%' group by orientador order by soma desc limit 20;
Silva, Marcos Antonio da|81575
Meihy, Jose Carlos Sebe Bom|62110
Glezer, Raquel|56500
Bellotto, Heloisa Liberalli|55690
Iokoi, Zilda Marcia Gricoli|52018
Marcilio, Maria Luiza|50775
Capelato, Maria Helena Rolim|46716
Aquino, Maria Aparecida de|45765
Moura, Esmeralda Blanco Bolsonaro de|41180
Souza, Marina de Mello e|39806
Camargo, Ana Maria de Almeida|38762
Souza, Laura de Mello e|38071
Carneiro, Henrique Soares|33788
Ferlini, Vera Lucia Amaral|32480
Machado, Maria Helena Pereira Toledo|31826
Wright, Antonia Fernanda Pacca de Almeida|31514
Barbosa, Wilson do Nascimento|31424
Hernandez, Leila Maria Gonçalves Leite|31272
Marquese, Rafael de Bivar|30091
Guarinello, Norberto Luiz|30005






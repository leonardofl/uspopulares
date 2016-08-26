
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







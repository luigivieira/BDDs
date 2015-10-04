# Diagramas de Decisão Binários (BDDs)

Material de aulas sobre Diagramas de Decisão Binários (BDDs, do inglês *Binary Decision Diagrams*).

> Criado por [Luiz Carlos Vieira](http://www.luiz.vieira.nom.br) em setembro de 2015 para a disciplina MAC0239 (Introdução à Lógica e Verificação de Programas) do curso de Ciência da Computação do Instituto de Matemática e Estatística da Universidade de São Paulo.

# Compilando com o LaTeX

Há dois alvos (targets) no Makefile: `aula1` e `aula2`. Se um alvo não for informado, o Makefile irá compilar as duas aulas.

O Makefile também é preparado (juntamente com o código de cada aula) para gerar os documentos PDF em diferentes formatos (razão de aspecto). Para tal, use a variável `FORMAT` como a seguir:

- Utilizando o valor `full`, é gerado o PDF com a razão de aspecto *full screen* (4:3).
- Utilizando o valor `wide`, é gerado o PDF com a razão de aspecto *wide screen* (16:9).
- O valor padrão (default, caso não informada) da variável é `full`.

Assim, por exemplo, se desejar produzir o PDF da aula 1 para apresentação em um projetor wide screen, compile da seguinte forma:

```
make aula1 FORMAT=wide
```

Se desejar produzir *todos* os PDFs (de ambas as aulas) para apresentação em um projetor mais comum (isto é, mais antigo e que não seja *wide screen*), use:

```
make FORMAT=full
```

ou simplesmente (já que `full` é o padrão):

```
make
```

# Referências

- O tema utilizado na apresentação (Beamer) é o [mtheme](https://github.com/matze/mtheme). Os arquivos necessários para o tema (`.sty`) se encontram no repositório junto com o arquivo de documento (`.tex`).
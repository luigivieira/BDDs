# Diagramas de Decisão Binários (BDDs)

Aula sobre Diagramas de Decisão Binários (BDDs, do inglês *Binary Decision Diagrams*).
Criado por Luiz Carlos Vieira em setembro de 2015.

# Compilando com o LaTeX

O Makefile é preparado para gerar os documentos PDF em diferentes formatos (razão de aspecto). Para tal, use o alvo (target) apropriado:

- O alvo *full* gera o PDF com a razão de aspecto 'full screen' (4:3).
- O alvo *wide* gera o PDF com a razão de aspecto 'wide screen' (16:9).
- O alvo *all* (padrão, se nenhum alvo for informado na linha de comando do `make`) utiliza a versão *wide*.

Assim, por exemplo, se desejar produzir o PDF para apresentação em um projetor wide screen, compile da seguinte forma:

```
make wide
```

ou simplesmente:

```
make
```

Se desejar produzir o PDF para projetores comuns (mais antigos), compile da seguinte forma:

```
make full
```

# Referências

- O tema utilizado na apresentação (Beamer) é o [mtheme](https://github.com/matze/mtheme). Os arquivos necessários para o tema (`.sty`) se encontram no repositório junto com o arquivo de documento (`.tex`).
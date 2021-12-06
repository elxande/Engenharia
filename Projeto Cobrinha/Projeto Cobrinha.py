#parei na aula 08.

import pygame, sys
from pygame.locals import *

largura = 800
altura = 600

def janela():#manipulando os objetos da tela   
    pygame.init()
    tela = pygame.display.set_mode([largura, altura])#definindo o tamanho da tela
    pygame.display.set_caption('Jogo da Cobrinha')#titulo
    fundo = pygame.image.load('imagem/fundo2.jpg')

    relogio = pygame.time.Clock()#frequencia dos objetos

#disponibilizando cores(referencias no paint)
    cor_branca = (255, 255, 255)
    cor_azul = (85, 85, 255)
    cor_verde = (136, 233, 107)
    cor_vermelha = (233, 77, 54)
    cor_preta = (0, 0, 0)
    cor_amarelo = (255,244,47)
    
#cria superficie com tamanho x
    #sup = pygame.Surface((800, 600))
    #sup.fill(cor_preta)#cor da superficie
    #sup2 = pygame.Surface()cria uma superficie com tamanho y
    #sup2.fill(cor_verde)cor da superficie2

#criando objetos dinâmicos    
    comida = pygame.Rect(50, 50, 20, 20)#criando a comida(a posicao deve ser múltipla de 11)
    cobrinha = pygame.Rect(0,0,20,20)#criando a cobra

#criando bordas
    #parede_superior = pygame.Rect(0,0,820,10)
    #parede_inferior = pygame.Rect(0,610,820,10)
    #parede_esquerda = pygame.Rect(0,10,10,610)
    #parede_direita = pygame.Rect(810,10,10,620)


    
#execução e condição de parada do jogo
    while True:
        for event in pygame.event.get():#captura evento
            if event.type == QUIT:#evento de saida(fechar a janela)
                pygame.quit()
                sys.exit()
            if event.type == pygame.KEYDOWN:#código para captura do teclado
                if event.key == pygame.K_ESCAPE:#saindo do jogo com a tecla Esc
                    pygame.quit()
                    sys.exit()

#captura do teclado e movimento da cobrinha   
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT or event.key == pygame.K_a or event.key == pygame.K_KP4:
                    cobrinha.move_ip(-10, 0)#esquerda

                if event.key == pygame.K_RIGHT or event.key == pygame.K_d or event.key == pygame.K_KP6:
                    cobrinha.move_ip(10, 0)#direita

                if event.key == pygame.K_DOWN or event.key == pygame.K_s or event.key == pygame.K_KP2:
                    cobrinha.move_ip(0, 10)#baixo

                if event.key == pygame.K_UP or event.key == pygame.K_w or event.key == pygame.K_KP8:
                    cobrinha.move_ip(0, -10)#cima

#condições de colisão
            if cobrinha.colliderect(comida):#colisão com comida
                cobrinha = pygame.Rect(0,0,20,40)
                

                #pygame.Rect.union(
                

        relogio.tick(100)#atribuição do valor de frequencia
        tela.fill(cor_branca)#cor da tela
        #tela.blit(sup,[10,10])#posicao da superficie
        tela.blit(fundo, (0,0))
        #tela.blit(sup2,[,])posicao da superficie2

#definindo objetos dinâmicos
        pygame.draw.rect(tela, cor_vermelha, comida)
        pygame.draw.rect(tela, cor_preta, cobrinha)

#definindo bordas
        #pygame.draw.rect(tela, cor_preta, parede_superior)
        #pygame.draw.rect(tela, cor_preta, parede_inferior)
        #pygame.draw.rect(tela, cor_preta, parede_esquerda)
        #pygame.draw.rect(tela, cor_preta, parede_direita)

        pygame.display.update()

    
                

janela()

#aula 12 - jogos com pygame

import pygame, sys
from pygame.locals import *


largura = 800
altura = 600

class Cobra(pygame.sprite.Sprite):
    def __init__(self):
        pygame.sprite.Sprite.__init__(self)
        self.ImagemCobra = pygame.image.load('imagem/cobra3.png')

        self.rect = self.ImagemCobra.get_rect()

        self.rect.centerx = 70# posicao inicial da cobrinha x e y
        self.rect.centery = 70

        self.velocidade = 20

        self.vida = True

    def inserir(self, superficie):
        superficie.blit(self.ImagemCobra, self.rect)

    def colisaoparedes(self):
        if self.vida == True:
            if self.rect.left < 0:
                self.rect.left = 780
                
            elif self.rect.right > 800:
                self.rect.right = 20

            elif self.rect.top < 0:
                self.vida = False
                #print('morreu')

            elif self.rect.bottom > 600:
                self.vida = False
                #print('morreu')    
            
    
def principalSnaker():
    pygame.init()
    tela = pygame.display.set_mode((largura, altura))  # definindo o tamanho da tela
    pygame.display.set_caption('Jogo da Cobrinha')  # titulo

    jogador = Cobra()
    Fundotela = pygame.image.load('imagem/fundo2.jpg')
    jogando = True

    while True:
        jogador.colisaoparedes()
        for evento in pygame.event.get():  # captura evento
            if evento.type == QUIT:  # evento de saida(fechar a janela)
                pygame.quit()
                sys.exit()

            if evento.type == pygame.KEYDOWN:#captura do teclado
                if evento.key == pygame.K_ESCAPE:#saindo do jogo com a tecla Esc
                    pygame.quit()
                    sys.exit()

            if evento.type == pygame.KEYDOWN: #captura do teclado e movimentacao
                if evento.key == pygame.K_LEFT or evento.key == pygame.K_a or evento.key == pygame.K_KP4:
                    jogador.rect.left -= jogador.velocidade #esquerda

                if evento.key == pygame.K_RIGHT or evento.key == pygame.K_d or evento.key == pygame.K_KP6:
                    jogador.rect.right += jogador.velocidade #direita

                if evento.key == pygame.K_DOWN or evento.key == pygame.K_s or evento.key == pygame.K_KP2:
                    jogador.rect.bottom += jogador.velocidade #baixo                    

                if evento.key == pygame.K_UP or evento.key == pygame.K_w or evento.key == pygame.K_KP8:
                    jogador.rect.top -= jogador.velocidade #cima   
                

            

        #colocando objetos na tela
        tela.blit(Fundotela,(0,0))
        jogador.inserir(tela)

        pygame.display.update()#atualiza a tela

principalSnaker()





'''
#manipulando os objetos da tela
pygame.init()
tela = pygame.display.set_mode([largura, altura])#definindo o tamanho da tela
pygame.display.set_caption('Jogo da Cobrinha')#titulo
fundo = pygame.image.load('imagem/fundo2.jpg')
#hamburguer = pygame.image.load('imagem/hamburguer.png')
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
pos_cobra = [1,10]
#cobrinha = pygame.Rect(0,0,20,20)#criando a cobra
cobrinha = pygame.Rect(20*(pos_cobra[0]),20*(pos_cobra[1]),20,20)

#criando bordas
    #parede_superior = pygame.Rect(0,0,820,10)
    #parede_inferior = pygame.Rect(0,610,820,10)
    #parede_esquerda = pygame.Rect(0,10,10,610)
    #parede_direita = pygame.Rect(810,10,10,620)


    
#execução e condição de parada do jogo
def captura_teclado():
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
                    #pos_cobra[0] -= 1

            if event.key == pygame.K_RIGHT or event.key == pygame.K_d or event.key == pygame.K_KP6:
                cobrinha.move_ip(10, 0)#direita
                    #pos_cobra[0] += 1

            if event.key == pygame.K_DOWN or event.key == pygame.K_s or event.key == pygame.K_KP2:
                cobrinha.move_ip(0, 10)#baixo
                    #pos_cobra[1] += 1

            if event.key == pygame.K_UP or event.key == pygame.K_w or event.key == pygame.K_KP8:
                cobrinha.move_ip(0, -10)#cima
                    #pos_cobra[1] -= 1
            pos_cobra = []
            cobrinha = pygame.Rect(20 * (pos_cobra[0]), 20 * (pos_cobra[1]), 20, 20)

#condições de colisão
            #if cobrinha.colliderect(comida):#colisão com comida
                #cobrinha = pygame.Rect(0,0,20,40)
                

                #pygame.Rect.union(
                

relogio.tick(100)#atribuição do valor de frequencia
tela.fill(cor_branca)#cor da tela
        #tela.blit(sup,[10,10])#posicao da superficie
#tela.blit(fundo, (0,0))
#comida.blit(hamburguer, (0,0))
#cobrinha.blit(cobra, (0,0))
        #tela.blit(sup2,[,])posicao da superficie2

#definindo objetos dinâmicos
pygame.draw.rect(tela, cor_vermelha, comida,)
pygame.draw.rect(tela, cor_preta, cobrinha)

#definindo bordas
        #pygame.draw.rect(tela, cor_preta, parede_superior)
        #pygame.draw.rect(tela, cor_preta, parede_inferior)
        #pygame.draw.rect(tela, cor_preta, parede_esquerda)
        #pygame.draw.rect(tela, cor_preta, parede_direita)

pygame.display.update()
'''
    
                



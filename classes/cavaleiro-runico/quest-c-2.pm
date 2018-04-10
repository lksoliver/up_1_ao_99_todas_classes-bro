sub initParamsQuestClasse2 {
	my ($classe) = @_;
	my %items = (
	#Possibilidade 1
    931 => "5 1 0", #Amuleto dos Orcs
    903 => "5 1 0", #Língua de Réptil
    1040 => "5 1 0", #Bigode de Anão Ancião
    7006 => "5 1 0", #Asa de Morcego Vermelha
    1057 => "5 1 0", #Pó de Traça
    1028 => "5 1 0", #Crina
    #Possibilidade 2
    966 => "5 1 0", #Carne de Ostra
    950 => "5 1 0", #Coração de Sereia
    1042 => "5 1 0", #Pata de Inseto
    1032 => "5 1 0", #Flor de Planta Carnívora
    7031 => "5 1 0", #Frigideira Velha
    946 => "5 1 0" #Casco de Caramujo

    ;
	Commands::run("conf -f questc2_implementada true");
	foreach $key (keys %items) {
        if ($classe == 1) { 
            Commands::run("iconf $key $items{$key}") 
        } else {
            Commands::run("iconf $key 0 1 0")
        }
    }
}

# 1 edit : reiropke
# Testada e Funcional por Sarampo 
automacro virarCavaleiro_Começo_irAoNpc {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNotNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do conf lockMap none
    do move prt_in 88 101
    }
}

automacro virarCavaleiro_Começo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # job change to knight
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0
    do talk resp 0
    [
    log ==============================
    log Falei com o Chefe dos cavaleiros
    log ==============================
    ]
    }
}


#coleta os itens só ocorre SE voce esta entre os joblvl 40 -> 49, no  joblvl 50 nao é necessario esta etapa

#automacro virarCavaleiro_PegarItens { #falta configurar
#    QuestActive 9000
#    exclusive 1
#}

#9000#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Herman, Capitão da Cavalaria, diz que você precisa obter aprovações de outros Cavaleiros para se tornar um. #
#Fale com outros membros da Cavalaria. #
automacro virarCavaleiro_irAoNpc2 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestActive   9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Dedicado/ #ou Sir Andrew
    call {
    do move prt_in 75 107
    do talk $.NpcNearLastBinId
    do talk resp 0
    [
    log ==============================
    log Falei com o Cavaleiro Dedicado
    log ==============================
    ]
    do move prt_in 71 91
    }
}        

#9003#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Andrew disse para você visitar Sir Siracuse para continuar com os testes. #
#Converse com Sir Siracuse #
automacro virarCavaleiro_irAoNpc3 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestActive   9003 #
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Honroso/ #ou Sir Siracuse
    call {
    do move prt_in 71 91 
    do talk $.NpcNearLastBinId
    do talk resp 0  #esta é a unica resposta certa as outras estao incertas.. porem precisa acertar 8 de 10 pra passar!!!
    do talk resp 3  #flamberge
    do talk resp 2  # provoke lvl 10
    do talk resp 2  #spear boomerang
    do talk resp 0  #zefiro
    do talk resp 1  #80%
    do talk resp 0  #indica uma bora area de up
    do talk resp 0  #proteger todo mundo
    do talk resp 0  #honra
    [
    log ==============================
    log Falei com o Cavaleiro Honroso
    log ==============================
    ]
    }
}        

#9004#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#James Siracuse disse para você visitar Sir Windsor para continuar com os testes. #
#Converse com Sir Windsor #
automacro virarCavaleiro_irAoNpc4 {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # 
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestActive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro das Lutas/ #ou Sir Windsor
    call {
    do move prt_in 79 94
    do talk $.NpcNearLastBinId
    do talk resp 0  
    [
    log ==============================
    log Falei com o Cavaleiro das Lutas
    log ==============================
    ]
    }
}

#9006#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Windsor não é de falar muito. Ele ordena que você mate todos os monstros na sala de testes. #
#Mate todos os monstros em 3 minutos #
automacro virarCavaleiro_irAoNpc4_parte_2_morri { 
    NotInMap job_knt
    NotInMap prt_fild05
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestActive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNotNear /Cavaleiro das Lutas/ #ou Sir Windsor
    call {
    do move prt_in 71 91 #CHECAR
    }
}

#9006#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Windsor não é de falar muito. Ele ordena que você mate todos os monstros na sala de testes. #
#Mate todos os monstros em 3 minutos #
automacro virarCavaleiro_irAoNpc4_parte_2_morri_cheguei {
    NpcNear /Cavaleiro das Lutas/
    exclusive 1
    QuestActive 9006 #
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0 
    lock virarCavaleiro_irAoNpc4_parte_2_morri_cheguei
    }
}

#9006#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Windsor não é de falar muito. Ele ordena que você mate todos os monstros na sala de testes. #
#Mate todos os monstros em 3 minutos #
automacro virarCavaleiro_irAoNpc4_parte_2 { 
    InMap job_knt
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 # CHECAR!!!!
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestActive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    call {
    do chat join 0
	do conf attackAuto 2
	do conf lockMap none
	do conf route_randomWalk 2
	lock virarCavaleiro_irAoNpc4_parte_2
    }
}

#9007#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Windsor disse para você visitar Amy Beatrice para o próximo teste. #
#Converse com Amy Beatrice #
automacro virarCavaleiro_irAoNpcmulher {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestActive   9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleira Educada/ #ou Amy Beatrice
    call {
    do move prt_in 69 107 #CHECAR
    do talk $.NpcNearLastBinId
    do talk resp 0  #apos falar com ela a quest 9008 é ativada
    do talk resp 2 #abre uma sala e espera 2
    do talk resp 2 # vou na frente
    do talk resp 1 #impeço mosntros de chegarem na party 1
    do talk resp 0 #pede pro sacer ajudar
    do talk resp 2 #decide com o grupo
    do talk resp 1 #abre um chat e espera
    do talk resp 2 # a sugestoes de onde caçar
    do talk resp 0 # leva a pessoa a saida 0
    do talk resp 0 # pede gentilmente a cura
    do talk resp 1 #pergunta se é de alguem 

    [
    log ==============================
    log Falei com a Cavaleira Educada , teste completo 
    log ==============================
    ]

    }
}        

#9009#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Amy Beatrice disse para você visitar Sir Edmond para o próximo teste. #
#Converse com Sir Edmond #
automacro virarCavaleiro_irAoNpcCalmo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestActive   9009 #
    QuestInactive 9010 #
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Devotado/ #ou Sir Edmond
    call {
    do move prt_in 70 99 #CHECAR
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do conf attackAuto 0
    do conf lockMap none
    do conf route_randomWalk 0
    pause 350
    [
    log ==============================
    log Falei com o Cavaleiro Devotado , teste completo 
    log ==============================
    ]
    }
}

#9010#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Edmond deu conselhos sobre uma boa atitude mental, e disse para você ser paciente. #
#Meditação #
automacro virarCavaleiro_matei_monstro {
    InMap prt_fild05
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestActive 9010 # 
    QuestInactive 9011 #
    QuestInactive 9012 #
    NpcNotNear /Cavaleiro Devotado/ #ou Sir Edmond
    call {
    do move prt_in 70 99
    }
}   

#9010#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Edmond deu conselhos sobre uma boa atitude mental, e disse para você ser paciente. #
#Meditação #
automacro virarCavaleiro_matei_monstro_voltei {
    NpcNear /Cavaleiro Devotado/
    exclusive 1
    QuestActive 9010 #
    call {
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do conf attackAuto 0
    do conf lockMap none
    do conf route_randomWalk 0
    lock virarCavaleiro_matei_monstro_voltei
    }
}

#9011#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Edmond disse para você encontrar Sir Gray para o teste final. #
#Converse com Sir Gray #
automacro virarCavaleiro_irAoNpcpenultimo {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 # 
    QuestInactive 9004 # 
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 # 
    QuestActive 9011 #
    QuestInactive 9012 #
    NpcNear /Cavaleiro Modesto/ #ou Sir Gray
    call {
    do move prt_in 87 92
    do talk $.NpcNearLastBinId
    do talk resp 0 
    do talk resp 2 
    do talk resp 1
    do talk resp 1
    do talk resp 0 

    [
    log ==============================
    log Falei com o Cavaleiro Modesto , teste completo 
    log ==============================
    ]
    }
}        

#9012#Mudança de Classe: Cavaleiro#SG_FEEL#QUE_NOIMAGE#
#Sir Gray disse para você falar com o Capitão para mudar de classe, já que você falou com todos os outros cavaleiros. Finalmente, é hora de se tornar Cavaleiro! #
#Converse com Sir Gray #
automacro virarCavaleiro_FIM {
    JobLevel = 50
    JobID $paramsClasses{idC1}
    exclusive 1
    QuestInactive 9000 #
    QuestInactive 9001 #
    QuestInactive 9002 #
    QuestInactive 9003 #
    QuestInactive 9004 #
    QuestInactive 9005 #
    QuestInactive 9006 #
    QuestInactive 9007 #
    QuestInactive 9008 #
    QuestInactive 9009 #
    QuestInactive 9010 # 
    QuestInactive 9011 #
    QuestActive   9012 #
    NpcNear /Chefe dos Cavaleiros/ #ou Chivalry Captain
    call {
    do move prt_in 88 101 #CHECAR
    do talk $.NpcNearLastBinId
    [
    log ==============================
    log Se tudo deu certo!
    log AGORA EU LUTO PELA JUSTIÇA E BONS COSTUMES!
    log ==============================
    ]
    }
}


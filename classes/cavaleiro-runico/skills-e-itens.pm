automacro configurarGolpeFulminante {
    SkillLevel SM_BASH = 10
    exclusive 1
    ConfigKeyNot attackSkillSlot_0 SM_BASH
    call {
        $blocoExiste = checarSeExisteNoConfig("attackSkillSlot_0")
        if ( $blocoExiste = nao ) {
            adicionaAttackSkillSlot()
            pause 1
            do reload config
        }
        do conf attackSkillSlot_0 SM_BASH
        do conf attackSkillSlot_0_lvl 10
        do conf attackSkillSlot_0_sp >= 15
        do conf attackSkillSlot_0_maxUses 1
        do conf attackSkillSlot_0_maxAttempts 3
        do conf attackSkillSlot_0_inLockOnly 1
    }
}
automacro configurarVigor {
    SkillLevel SM_ENDURE = 10
    ConfigKeyNot useSelf_skill_0 SM_ENDURE
    priority 0
    exclusive 1
    call {
        $blocoExiste = checarSeExisteNoConfig("useSelf_skill_0")
        if ( $blocoExiste = nao ) {
            adicionaUseSelfSkill()
            pause 1
            do reload config
        }
        do conf useSelf_skill_0 SM_ENDURE
        do conf useSelf_skill_0_lvl 10
        do conf useSelf_skill_0_sp >= 15%
        do conf useSelf_skill_0_whenStatusInactive EFST_POSTDELAY, Vigor
        do conf useSelf_skill_0_disabled 0
        do conf useSelf_skill_0_agressives > 1
        do conf useSelf_skill_0_timeout 10
    }
}

automacro pegarPeco_irAteNpc {
    SkillLevel KN_CAVALIERMASTERY = 5
    exclusive 1
    StatusInactiveHandle EFST_RIDING
    NpcNotNear /Criador de Pecopecos/
    Zeny >= 3500
    BaseLevel != 99
    priority -3
    call {
        do move prontera 50 341 &rand(3,7)
    }
}

automacro pegarPeco {
    SkillLevel KN_CAVALIERMASTERY = 5
    exclusive 1
    StatusInactiveHandle EFST_RIDING
    NpcNear /Criador de Pecopecos/
    priority -3
    BaseLevel != 99
    Zeny >= 3500
    call {
        do talk $.NpcNearLastBinId
        do talk resp 0
    }
}

automacro configurarPotLaranja {
    InInventoryID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    InStorageID 569 < 1 #Poção de Aprendiz (não pode ter essa poção)
    Zeny > 30000
    BaseLevel != 99
    JobID $parametrosClasses{idC2}, $parametrosClasses{idBC2}, $parametrosClasses{idC2Alt}, $parametrosClasses{idBC2Alt}
    ConfigKeyNot useSelf_item_0 Poção de Aprendiz #só se ativa quando nao ta usando mais pot aprendiz
    ConfigKeyNot useSelf_item_0 Poção Laranja
    exclusive 1
    call {
        [
        log ===================================
        log = configurando poção laranja
        log ===================================
        ]
        do iconf 502 100 0 0 #pot laranja
        if (&config(buyAuto_1) = Poção Laranja ) {
            log pot Laranja já está configurada, essa mensagem não deveria aparecer
            log caso apareça repetidamente, relate aos criadores da macro
        } else {
            adicionaBuyAuto() #preciso adicionar um bloco novo, porque o bloco
            #de buyauto padrão não tem o "zeny" como chave, apesar que deveria
            pause 1
            do reload config 

            do conf buyAuto_1 Poção Laranja
            do conf buyAuto_1_maxAmount 100
            do conf buyAuto_1_zeny > 30000
            do conf buyAuto_1_npc payon_in01 5 49
            do conf buyAuto_1_disabled 0
        }
        $blocoExiste = checarSeExisteNoConfig("useSelf_item_0")
        if ( $blocoExiste = nao ) {
            adicionaUseSelfItem()
            pause 1
            do reload config
        }
        do conf useSelf_item_0 Poção Laranja
        do conf useSelf_item_0_hp < 50%
        do conf useSelf_item_0_disabled 0

        [
        log ========================================
        log Configação para usar e comprar Poção Laranja
        log feita com sucesso
        log ========================================
        ]
    }
}


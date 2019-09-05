
describe 'Testes de frente de vendas', :testes do

describe 'Abre um caixa no sistema com R$1000.00', :abrircaixa do
 
    it 'Abrir caixa' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(find('#titulo-header').visible?).to be true
        
          
        visit ('https://ecomanda.app/caixas/aberto')
    
        fill_in 'dinheiroEmCaixa', with: '1000,00'
        select('Manhã', from: 'comboPeriodo')
        click_button 'Ok'
        expect(page).to have_content 'Dinheiro em caixa: R$ 1.000,00'
        
        
        end
    
    end  


    describe 'Lanca um gasto no valor de R$50,00', :gastos do
 
        it 'lancar gastos' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
            
                    
            visit ('https://ecomanda.app/caixas/aberto')
    
            click_link('Gastos')
            click_link('Cadastrar novo gasto (F1)') 
    
            fill_in 'descricaoGasto', with: 'Teste'
            fill_in 'valorGasto', with: '50,00'
            click_button 'Gravar'
            expect(page).to have_content 'Gastos: -R$ 50,00'
    
            
    
        end
    end

    describe 'Lança uma sangria no valor de R$50,00', :sangria do
 
        it 'lançar sangria' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
            
                    
            visit ('https://ecomanda.app/caixas/aberto')
    
            click_link('Ver Sangrias (F6)')
            
            click_link('Cadastrar nova sangria (F1)') 
    
            fill_in 'descricaoSangria', with: 'Teste'
            fill_in 'valorSangria', with: '50,00'
            click_button 'Gravar'
            expect(page).to have_content 'Sangrias: -R$ 50,00'
    
                end
    end
    

        
    
    describe 'Lança um suprimento no valor de R$100', :suprimentos do
 
        it 'lançar suprimento' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
            
                    
            visit ('https://ecomanda.app/caixas/aberto')
    
            click_link('Ver Suprimentos (F7)')
            click_link('Cadastrar novo suprimento (F1)') 
    
            fill_in 'descricaoSuprimento', with: 'Teste'
            fill_in 'valorSuprimento', with: '100,00'
            click_button 'Gravar'
            expect(page).to have_content 'Suprimentos: R$ 100,00'
    
            
        end
    end
    
        

    describe 'Lança um pedido entrega 1', :entrega do
 
        it 'lançar pedido entrega 1' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
    
            visit 'https://ecomanda.app/pedidos/entregas'
    
            fill_in 'telefone-busca', with: '20203030'
    
            click_button 'Consultar'
    
            click_link('Entregar neste (F1)')
            
            find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
            find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
            ").click
    
             fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '43,00'
    
            find(:xpath, "//span[contains(.,'Finalizar')]").click
    
                           
        end
    end

    
describe 'Conferir o pedido entrega 1', :conferir1 do

    it 'Conferir o pedido entrega 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Total pedido + troco: R$ 43,00'
    
           
        end
    
    end

    
describe 'Lança um pedido entrega com atributo 2', :entregaatributo do
 
    it 'lançar pedido entrega com atributo 2' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Entregar neste (F1)')
        
       
        find('li', text:'Batata Frita').click

        find('li', text:'Cobertura de queijo e calabresa').click
         
        find('#atributoFinalizar').click

        find('#pedidoResumoFinalizarPedido').click

        find('input[id$=d39523e4536e]').set '50,00'

        click_button 'Finalizar'

            
    end
end



describe 'Conferir o pedido entrega com atributo 2', :conferirentrega2 do

    it 'Conferir o pedido entrega com atributo 2' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '2'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Dinheiro R$50,00'
    
          
    end
    
end


describe 'Lança um pedido entrega com mix 3', :entregamix do
 
    it 'lançar pedido entrega com mix' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Entregar neste (F1)')
        
       
        find('li', text:'PIZZA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixIniciar']").click

        find('li', text:'ATUM GRANDE').click

        find('li', text:'BAIANA GRANDE').click

        find('li', text:'CALABRESA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixFinalizar']").click

        find('#pedidoResumoFinalizarPedido').click

        find('input[id$=d39523e4536e]').set '45.00'

        click_button 'Finalizar'

        
    end
end



describe 'Conferir o pedido entrega mix 3', :conferirmix do

    it 'Conferir o pedido entrega mix' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '3'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Dinheiro R$45,00'
    
          
     end
    
end


describe 'Lança um pedido entrega com desconto 4', :entregadesconto do
 
    it 'lançar pedido entrega com desconto 4' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Entregar neste (F1)')

        find(:xpath, "//div[@id='pedidoResumo']/ul/li[2]/a").click
        find('input[value="1"]').click

        fill_in 'valorNovaTaxa', with: '-5,00'

        choose('Cliente VIP')

        click_button 'Alterar'

                
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

         fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '38,00'

        # find(:xpath, "//span[contains(.,'Finalizar')]").click

        click_button 'Finalizar'
                                
    end
end



describe 'Conferir o pedido entrega com desconto 4', :conferirentreg_desconto do

    it 'Conferir o pedido entrega com desconto 4' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '4'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 5,00'
    
    end
    
end




describe 'Lança um pedido entrega com cupom de desconto 5', :entregacupom do
 
    it 'lançar pedido entrega cupom de desconto 5' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
 
        click_button 'Entrar'

        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Entregar neste (F1)')

        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

        find(:xpath, "//input[@id='cupom-desconto']").click

        find(:xpath, "//input[@id='cupom-desconto']").set 'teste1'


        find('input[id$=d39523e4536e]').click
        find('input[id$=d39523e4536e]').click
        find('input[id$=d39523e4536e]').set '39,20'

        # fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '39,20'

        # click_button 'Finalizar'


        find(:xpath, "//span[contains(.,'Finalizar')]").click

       end
end


describe 'Conferir o pedido entrega 5 com cupom de desconto', :conferirentreg_cupom do

    it 'Conferir o pedido entrega 5 com cupom de desconto' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 3,00'
    
    end
    
end

describe 'Edita um pedido consultando via painel de entregas', :editarpedido do
 
    it 'Edita um pedido consultando via painel de entregas' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        click_link 'Painel de entregas (F2)'

        find(:xpath, "//p[contains(.,'Sequência: 1')]").click

        click_link 'Editar pedido (F9)'


         find(:xpath, "//td[contains(.,'(1) Frango a Passarinho')]").click

         find(:xpath, "//input[@id='pedidoResumoApagarProd']").click         

        
         
         find('li', text:'Batata Frita').click

         find('li', text:'Cobertura de queijo e calabresa').click
          
         find('#atributoFinalizar').click
 
         find('#pedidoResumoFinalizarPedido').click
 
         find('input[id$=d39523e4536e]').set '50,00'

         click_button 'Finalizar'


         choose('Desistência do cliente')


         click_button 'Confirmar'

   end

end



describe 'Conferir o pedido entrega editado', :conferiredit do

    it 'Conferir o pedido entrega editado' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Dinheiro R$50,00'
    
          
     end
    
 end

 
describe 'Finaliza o pedido entrega 1', :finalizarentrega1 do

    it 'Finaliza o pedido entrega 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        click_link 'Finalizar pedido (F2)'

        find(:xpath, "(//input[@type='text'])[4]").set '100,00' 
       
        
        click_button 'Finalizar (F4)'
       
     end
    
end


describe 'Finaliza o pedido entrega 2', :finalizarentrega2 do

    it 'Finaliza o pedido entrega 2' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '2'
    
        find('input[value="Consultar"]').click
    
        click_link 'Finalizar pedido (F2)'

        find(:xpath, "(//input[@type='text'])[4]").set '50,00' 
       
        
        click_button 'Finalizar (F4)'

        end
    
    end

    
describe 'Finalizar o pedido entrega 3', :finalizarentrega3 do

    it 'Finalizar o pedido entrega 3' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '3'
    
        find('input[value="Consultar"]').click
    
        click_link 'Finalizar pedido (F2)'

        find(:xpath, "(//input[@type='text'])[4]").set '45,00' 
       
        
        click_button 'Finalizar (F4)'

    end
    
end


describe 'Finalizar o pedido entrega 4', :finalizarentrega4 do

    it 'Finalizar o pedido entrega 4' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '4'
    
        find('input[value="Consultar"]').click
    
        click_link 'Finalizar pedido (F2)'

        find(:xpath, "(//input[@type='text'])[4]").set '38,00' 
       
        
        click_button 'Finalizar (F4)'

        end
    
    end    
    
    
    describe 'Finalizar o pedido entrega 5', :finalizarentrega5 do

        it 'Finalizar o pedido entrega 5' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
        
               
            find('input[id$=numeroBusca]').set '5'
        
            find('input[value="Consultar"]').click
        
            click_link 'Finalizar pedido (F2)'
    
            find(:xpath, "(//input[@type='text'])[4]").set '39,20' 
           
            
            click_button 'Finalizar (F4)'
    
            end
        
        end  


    describe 'Lança um pedido balcão', :balcaocomum do
 
        it 'Lança um pedido balcão' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
    
            visit 'https://ecomanda.app/pedidos/balcao'
    
                    
            find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
            find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
            ").click
    
             fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '43,00'
    
            find(:xpath, "//span[contains(.,'Finalizar')]").click
    
                                  
        end
    end


    
describe 'Conferir o pedido balcao 1', :balcaocomumconferir1 do

    it 'Conferir o pedido balcao 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '6'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Tipo do pedido: Balcão' and 'Total: R$ 30,00'
    
          
     end
    
end



describe 'Lança um pedido balcão 2 com atributo', :balcaoatributo do
 
    it 'Lança um pedido balcão 2 com atributo' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/balcao'

      
        find('li', text:'Batata Frita').click

        find('li', text:'Cobertura de queijo e calabresa').click
         
        find('#atributoFinalizar').click

        find('#pedidoResumoFinalizarPedido').click

        find('input[id$=d39523e4536e]').set '50,00'

        click_button 'Finalizar'

            
    end
end



describe 'Conferir o pedido balcão 2 com atributo', :balcaocomumconferir2 do

    it 'Conferir o pedido balcão 2 com atributo' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        # find('input[type="checkbox"]').click
    
        find('input[id$=numeroBusca]').set '7'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Tipo do pedido: Balcão' and 'Total: R$ 29,00'
    
          
             end
    
    end


    
describe 'Lança um pedido balcao 3 com mix', :balcaogamix do
 
    it 'Lança um pedido balcao 3 com mix' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/balcao'

           
       
        find('li', text:'PIZZA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixIniciar']").click

        find('li', text:'ATUM GRANDE').click

        find('li', text:'BAIANA GRANDE').click

        find('li', text:'CALABRESA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixFinalizar']").click

        find('#pedidoResumoFinalizarPedido').click

        find('input[id$=d39523e4536e]').set '45.00'

        click_button 'Finalizar'

                    
    end
end


describe 'Conferir o pedido balcão 3 mix', :balcaocomumconferir3 do

    it 'Conferir o pedido balcão 3 mix' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
             
        find('input[id$=numeroBusca]').set '8'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Tipo do pedido: Balcão' and 'Total: R$ 40,00'
    
          
     end
    
end

describe 'Lança um pedido balcao 4 com desconto', :balcaodesconto do
 
    it 'Lança um pedido balcao 4 com desconto' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/balcao'

        
    
        click_link 'alterar'

        find('input[value="1"]').click

        find('input[id="valorNovaTaxa"]').set "-5,00"
    
        choose('Cliente VIP')

        click_button 'Alterar'
    

                
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

         fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '25,00'

        find(:xpath, "//span[contains(.,'Finalizar')]").click
           
        
    end
end



describe 'Conferir o pedido balcão 4 com desconto', :balcaocomumconferir4 do

    it 'Conferir o pedido balcão com desconto' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '9'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 5,00'
    
        end
    
    end


    
    describe 'Lança um pedido balcao 5 com acréscimo', :balcaoacrescimo do
 
        it 'Lança um pedido balcao 5 com acréscimo' do 
        
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
    
            visit 'https://ecomanda.app/pedidos/balcao'
    
               
            click_link 'alterar'
    
            find('input[value="1"]').click
    
            find('input[id="valorNovaTaxa"]').set " 5,00"
        
            choose('Cliente VIP')
    
            
            click_button 'Alterar'
    
           
            find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
            find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
            ").click
    
             fill_in '2d0bf9a0-3083-47ae-84b2-d39523e4536e', with: '35,00'
    
            find(:xpath, "//span[contains(.,'Finalizar')]").click
               
        end
    end

    
describe 'Conferir o pedido balcao 5 acréscimo', :balcaocomumconferir5 do

    it 'Conferir o pedido balcao 5 acréscimo' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
       
        find('input[id$=numeroBusca]').set '10'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: R$ 5,00'
    
        end
    
    end


    
describe 'Corrigir o pagamento de um pedido entrega', :entregacorrigpag1 do

    it 'Corrigir o pagamento de um pedido entrega' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        click_link 'Corrigir (F11)'

        click_button 'Ok'

        find(:xpath, "(//input[@type='text'])[5]").set '35,00' 
    
        click_button 'Finalizar (F4)'
    
             end
    
    end

    
describe 'Conferir a edição do pedido entrega', :conferircorrecao1 do

    it 'Conferir a edição do pedido entrega' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
            
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Mastercard'
    
        end
    
    end





    
describe 'Corrigir o pagamento de um pedido balcao', :balcaocorrigpag2 do

    it 'Corrigir o pagamento de um pedido balcao' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
           
        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        click_link 'Corrigir (F11)'

        click_button 'Ok'

        find(:xpath, "(//input[@type='text'])[5]").set '39,20' 
    
        click_button 'Finalizar (F4)'
    
             end
    
    end


    
describe 'Conferir a correção do pedido balcão', :conferircorrecao2 do

    it 'Conferir a correção do pedido balcão' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
            
        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Mastercard'
    
        end
    
    end

    
describe 'Realiza um pedido comanda 1',  :pedidocomanda1 do

    it 'Realiza um pedido comanda 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'NOVO PEDIDO').click


        find('input', id:'numeroComanda').set '1'
        

        find('li', text:'NOVO PEDIDO').click

        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

    end

end
  

describe 'Aplica um desconto em uma comanda 1',  :comandadesconto do

    it 'Aplica um desconto em uma comanda 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'INSERIR DESCONTO').click

        find('input', id:'numeroComanda').set '1'

        find('li', text:'INSERIR DESCONTO').click

        choose('Em Reais')

        find('input', id:'valorDesconto').set '5,00'

        choose('Cliente VIP')

        click_button 'Gravar'

      
    end

end


describe 'Conferir desconto na comanda 1', :conferirdescontocomanda do

    it 'Conferir desconto na comanda 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="2"]').click
    
            
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 5,00'
    
    end
    
end



describe 'Transferir produtos da comanda 1 para a comanda 5',  :comandatransferir do

    it 'Transferir produtos da comanda 1 para a comanda 5' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'VER RESUMO (F2)').click

        find('input', id:'numeroComanda').set '1'

        find('li', text:'VER RESUMO (F2)').click

        uncheck('Agrupar informações')

        find_all('tbody', text:'Frango a Passarinho').sample.click

        click_button 'Transferir'

        find('input', id:'numeroNovaComanda').set '5'

        click_button 'Prosseguir'

        find('input', id:'quantidadeCouvert').set '1'

        click_button 'Transferir produtos'

        
               
    end

end



describe 'Conferir transferencia de produtos', :conferirtransferencia do

    it 'Conferir transferencia de produtos' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="2"]').click
                
        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Número da comanda: 5'
    
        end
    
     end


     
describe 'Realiza um pedido mix na comanda 1',  :pedidocomanda1mix do

    it 'Realiza um pedido mix na comanda 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'NOVO PEDIDO').click


        find('input', id:'numeroComanda').set '1'
        

        find('li', text:'NOVO PEDIDO').click

        find('li', text:'PIZZA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixIniciar']").click

        find('li', text:'ATUM GRANDE').click

        find('li', text:'BAIANA GRANDE').click

        find('li', text:'CALABRESA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixFinalizar']").click

            
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

    end

end



describe 'Conferir produto mix lançado na comanda 1', :conferirmixcomanda1 do

    it 'Conferir produto mix lançado na comanda 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="2"]').click
                
        find('input[id$=numeroBusca]').set '1'
    
        find('input[value="Consultar"]').click

        # click_link 'Ver produtos (F3)' 

    
        expect(page).to have_content 'Total: R$ 44,00'
    
        end
    
     end


     describe 'Fechar a comanda 1',  :fecharcomanda1 do

        it 'Fechar a comanda 1' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
    
            visit 'https://ecomanda.app/pedidos/comandas'
    
        
            find('li', text:'FECHAR COMANDA (F3').click
    
            find('input', id:'numeroComanda').set '1'
    
            find('li', text:'FECHAR COMANDA (F3').click
    
            click_button 'Sim'
    
            click_button 'Fechar conta'
    
    
             end
    
    end


    describe 'Reabrir comanda 1', :reabrircomanda1 do

        it 'Reabrir comanda 1' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="2"]').click
                    
            find('input[id$=numeroBusca]').set '1'
        
            find('input[value="Consultar"]').click
    
            click_link 'Reabrir conta (F7)' 

            click_button 'Sim'
    
        
            expect(page).to have_content 'Conta fechada ? Não'
        
            end
        
         end


describe 'Lançar 3 produtos na comanda 1 via mapa de comandas', :mapacomanda1 do

    it 'Lançar 3 produtos na comanda 1 via mapa de comandas' do 
            
        visit 'https://ecomanda.app'
        
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
             
        click_button 'Entrar'
            
        expect(page).to have_content 'Início'
        
        visit 'https://ecomanda.app/pedidos/comandas#/mapa'
    
        find('li', text:'1').click
    
        click_button 'Fazer pedido'
                        
    find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
    find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
    find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
    find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']").click
                        
    end
                        
end


 describe 'Cancelar 1 produto da comanda numero 1 via mapa de comandas', :cancelamapacomanda do

    it 'Cancelar 1 produto da comanda numero 1 via mapa de comandas' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos/comandas#/mapa'
    
            find('li', text:'1').click
    
            click_button 'Ver Produtos'
    
            uncheck('Agrupar informações')
    
            # find_all('tr', text:'Frango a Passarinho').sample.click


            find('tr', text:'PIZZA GRANDE').click


    
            click_button 'Apagar'
    
            choose('Erro de lançamento')
    
            click_button 'Confirmar'
    
     end
    
end


    

describe 'Fecha acomanda numero 5 via mapa de comandas', :fechacomandamapa do

    it 'Fecha acomanda numero 5 via mapa de comandas' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos/comandas#/mapa'

        find('li', text:'5').click

        click_button 'Fechar comanda'

        click_button 'Sim'

        click_button 'Fechar conta'
        
        end

end


describe 'Conferir comanda 5 fechada', :conferircomanda5fechada do

    it 'Conferir comanda 5 fechada' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="2"]').click
                
        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Conta fechada ? Sim'
    
        end
    
     end



     
describe 'Finalizar comanda 5', :finalizacomanda5 do

    it 'Finalizar comanda 5' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos/finalizar'

        find('input[value="2"]').click

        find('input[id$=numeroBusca]').set '5'
    
        find('input[value="Consultar"]').click
    
        find(:xpath, "(//input[@type='text'])[5]").set '100,00' 
       
        click_button 'Finalizar (F4)'

        expect(page).to have_content 'Pedido finalizado com sucesso!' 

        end

end


describe 'Realiza um pedido na comanda 1 com 2 produtos',  :pedidocomanda1produtos do

    it 'Realiza um pedido na comanda 1 com 2 produtos' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'NOVO PEDIDO').click


        find('input', id:'numeroComanda').set '1'
        

        find('li', text:'NOVO PEDIDO').click

        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

    end

end




describe 'Realiza um pedido na comanda 2 com 2 produtos',  :pedidocomanda2 do

    it 'Realiza um pedido na comanda 2 com 2 produtos' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/comandas'

    
        find('li', text:'NOVO PEDIDO').click


        find('input', id:'numeroComanda').set '2'
        

        find('li', text:'NOVO PEDIDO').click

        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

    end

end



describe 'Finalizar comandas unificadas 1 e 2', :finalizacomandasunificadas do

    it 'Finalizar comandas unificadas 1 e 2' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos/finalizar'

        find('input[value="2"]').click

        find('input[id$=numeroBusca]').set '1'

        find('input[value="Consultar"]').click

        click_button 'Fechar conta'

        click_link 'Transferir comandas para este pedido (F1)'

        find('input[type="number"]').set '2'

        click_button 'Gravar'

        click_link 'Voltar (ESC)'

        find(:xpath, "(//input[@type='text'])[5]").set '270,00' 
       
        click_button 'Finalizar (F4)'

        expect(page).to have_content 'Pedido finalizado com sucesso!' 

        end

end


describe 'Lança um pedido retirada 1', :retirada1 do
 
    it 'lançar pedido retirada 1' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')
        
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

        find(:xpath, "//span[contains(.,'Finalizar')]").click
      
                       
    end
end

describe 'Conferir o pedido retirada 1', :conferirretirada1 do

    it 'Conferir o pedido retirada 1' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '11'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Total pedido + troco: R$ 30,00'
    
           
        end
    
    end


describe 'Lança um pedido retirada 2 com atributo', :retirada2 do
 
    it 'Lança um pedido retirada 2 com atributo' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')
               
        find('li', text:'Batata Frita').click

        find('li', text:'Cobertura de queijo e calabresa').click
         
        find('#atributoFinalizar').click

        find('#pedidoResumoFinalizarPedido').click

        find(:xpath, "//span[contains(.,'Finalizar')]").click
    
     
    end 

end


describe 'Conferir o pedido retirada 2', :conferirretirada2 do

    it 'Conferir o pedido retirada 2' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '12'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Total pedido + troco: R$ 29,00'
    
           
        end
    
    end


describe 'Lança um pedido retirada 3 com mix', :retirada3 do
 
    it 'Lança um pedido retirada 3 com atributo' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')       
       
        find('li', text:'PIZZA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixIniciar']").click

        find('li', text:'ATUM GRANDE').click

        find('li', text:'BAIANA GRANDE').click

        find('li', text:'CALABRESA GRANDE').click

        find(:xpath, "//div[@id='pedidoAcoesProdutoMixFinalizar']").click

        find('#pedidoResumoFinalizarPedido').click

        find(:xpath, "//span[contains(.,'Finalizar')]").click

 
    end
end

describe 'Conferir o pedido retirada 3', :conferirretirada3 do

    it 'Conferir o pedido retirada 3' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '13'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Total pedido + troco: R$ 40,00'
    
           
        end
    
    end



describe 'Lança um pedido retirada 4 com desconto', :retirada4 do
 
    it 'Lança um pedido retirada 4 com desconto' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')   
        
        click_link('alterar')
        
        find('input[value="1"]').click

        fill_in 'valorNovaTaxa', with: '-5,00'

        choose('Cliente VIP')

        click_button 'Alterar'

                
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

        find(:xpath, "//span[contains(.,'Finalizar')]").click

    end

end

describe 'Conferir o pedido retirada 4', :conferirretirada4 do

    it 'Conferir o pedido retirada 4' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '14'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 5,00'
    
           
        end
    
    end


describe 'Lança um pedido retirada 5 com acréscimo', :retirada5 do
 
    it 'Lança um pedido retirada 5 com acréscimo' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')   
        
        click_link('alterar')
        
        find('input[value="1"]').click

        fill_in 'valorNovaTaxa', with: '5,00'

        choose('Cliente VIP')

        click_button 'Alterar'

                
        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']
        ").click

        find(:xpath, "//span[contains(.,'Finalizar')]").click

    end
end


describe 'Conferir o pedido retirada 5', :conferirretirada5 do

    it 'Conferir o pedido retirada 5' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '15'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: R$ 5,00'
    
           
        end
    
    end



describe 'Lança um pedido retirada 6 com cupom de desconto', :retirada6 do
 
    it 'Lança um pedido retirada 6 com cupom de desconto' do 
    
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'

        visit 'https://ecomanda.app/pedidos/entregas'

        fill_in 'telefone-busca', with: '20203030'

        click_button 'Consultar'

        click_link('Retirada (F9)')   

        find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click
        find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']").click

        find(:xpath, "//input[@id='cupom-desconto']").set 'teste1'

        find(:xpath, "//span[contains(.,'Finalizar')]").click

        find(:xpath, "//span[contains(.,'Finalizar')]").click

       
    end

end

describe 'Conferir o pedido retirada 6', :conferirretirada6 do

    it 'Conferir o pedido retirada 6' do 
        
        visit 'https://ecomanda.app'
    
        fill_in 'email', with: 'testev2@teste.com.br'
        fill_in 'senha', with: '1234'
         
        click_button 'Entrar'
        
        expect(page).to have_content 'Início'
    
        visit 'https://ecomanda.app/pedidos'
    
        find('input[value="3"]').click
    
        find('input[id$=numeroBusca]').set '16'
    
        find('input[value="Consultar"]').click
    
        expect(page).to have_content 'Desconto / acréscimo: -R$ 3,00'
    
           
        end
    
    end


    describe 'Finaliza o pedido retirada 1', :finalizarretirada1 do

        it 'Finaliza o pedido retirada 1' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
        
               
            find('input[id$=numeroBusca]').set '11'
        
            find('input[value="Consultar"]').click
        
            click_link 'Finalizar pedido (F2)'
    
            find(:xpath, "(//input[@type='text'])[4]").set '30,00' 
           
            
            click_button 'Finalizar (F4)'

            expect(page).to have_content 'Pedido finalizado com sucesso!'
           
         end
        
    end

    
    describe 'Finaliza o pedido retirada 2', :finalizarretirada2 do

        it 'Finaliza o pedido retirada 2' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
        
               
            find('input[id$=numeroBusca]').set '12'
        
            find('input[value="Consultar"]').click
        
            click_link 'Finalizar pedido (F2)'
    
            find(:xpath, "(//input[@type='text'])[4]").set '40,00' 
           
        
            click_button 'Finalizar (F4)'

            expect(page).to have_content 'Pedido finalizado com sucesso!'

            
           
         end
        
    end


    describe 'Edita pedido acrescentando produto e Finaliza o pedido retirada 3', :finalizarretirada3 do

        it 'Edita pedido acrescentando produto e Finaliza o pedido retirada 3' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
        
               
            find('input[id$=numeroBusca]').set '13'
        
            find('input[value="Consultar"]').click
        
            click_link 'Finalizar pedido (F2)'

            click_link 'Editar pedido (F8)'

            find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click

            find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']").click

            find(:xpath, "//span[contains(.,'Finalizar')]").click
    
            # find(:xpath, "(//input[@type='text'])[3]").set '' 

            find(:xpath, "(//input[@type='text'])[4]").set '200,00'
           
            click_button 'Finalizar (F4)'

            sleep 5

            expect(page).to have_content 'Pedido finalizado com sucesso!'
           
         end
        
    end


    describe 'Finaliza o pedido retirada 4 através do mapa de retirada', :finalizarretirada4 do

        it 'Finaliza o pedido retirada 4 através do mapa de retirada' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos/entregas#/painel-retirada?idCaixa='
        
            find(:xpath, "//p[contains(.,'Sequência: 14')]").click
                     
                   
            click_link 'Finalizar pedido (F2)'
    
            find(:xpath, "(//input[@type='text'])[4]").set '35,00' 
           
            
            click_button 'Finalizar (F4)'

            expect(page).to have_content 'Pedido finalizado com sucesso!'

        end
    end


    describe 'Edita e depois Finaliza o pedido retirada 5', :finalizarretirada5 do

        it 'Edita e depois Finaliza o pedido retirada 5' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
                       
            find('input[id$=numeroBusca]').set '15'
        
            find('input[value="Consultar"]').click
                   
            click_link 'Editar pedido (F9)'

            find(:xpath, "//div[@id='pedidoProdutos']/ul/li[3]").click

            find(:xpath, "//input[@id='pedidoResumoFinalizarPedido']").click

            find(:xpath, "//span[contains(.,'Finalizar')]").click

            click_link 'Finalizar pedido (F2)'
    
            find(:xpath, "(//input[@type='text'])[4]").set '65,00' 
           
            click_button 'Finalizar (F4)'

            expect(page).to have_content 'Pedido finalizado com sucesso!'

        end

    end

    describe 'Edita e depois Finaliza o pedido retirada 6', :finalizarretirada6 do

        it 'Edita e depois Finaliza o pedido retirada 6' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'
        
            visit 'https://ecomanda.app/pedidos'
        
            find('input[value="3"]').click
                       
            find('input[id$=numeroBusca]').set '16'
        
            find('input[value="Consultar"]').click
                   
            click_link 'Cancelar pedido (F8)'

            find('input[type="text"]').set 'Pedido de teste ecomanda'

            click_button 'Confirmar'

            expect(page).to have_content 'Estado: Cancelado'

            
            end

    end


      describe 'Finalizar o caixa', :fecharcaixa do

        it 'Finalizar o caixa' do 
            
            visit 'https://ecomanda.app'
        
            fill_in 'email', with: 'testev2@teste.com.br'
            fill_in 'senha', with: '1234'
             
            click_button 'Entrar'
            
            expect(page).to have_content 'Início'

            visit 'https://ecomanda.app/caixas/aberto'

            click_link 'Fechar este caixa (F1)'

            click_button 'Sim'

            click_button 'Ok'

            

            find(:xpath, "(//input[@type='text'])[8]").set '1.197,80' 

            find(:xpath, "(//input[@type='text'])[9]").set '444,20' 

            find(:xpath, "(//input[@type='text'])[10]").set '0,00' 

            find(:xpath, "(//input[@type='text'])[11]").set '0,00'

            find(:xpath, "(//input[@type='text'])[12]").set '170,00' 

            find(:xpath, "(//input[@type='text'])[13]").set '0,00'

            find('input[value="Finalizar"]').click                          
    
            click_button 'Sim'


            expect(page).to have_content 'Total	R$	R$ 1.812,00'

        end

    end


    









        



















end

    
            
                    
    
    
            
    
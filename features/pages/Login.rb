class Login < SitePrism::Page

    element :usuario, "[name='login-email']"
    element :mensagem, "[class*='smart-sign-in__text']"
    element :entrar, "[type='submit']"
    element :senha, "[type='password']"
    element :continuar, "[data-test='login-btn']"
    element :erroAcesso, "[class='error-message ember-view']"
end
const {Selector} = require('testcafe');

fixture(`Tests`).page("http://localhost:4200/login");

test('Login and see the dashboard', async t => {
    await t
        .typeText('#usernameField', 'boobie@email.dk')
        .typeText('#passwordField', 'password')
        
        .click("#loginButton.login-button")
        .wait(2000)

        .expect(Selector('#doorOverview').exists).ok()
});

test('Login and see the history page', async t => {
    await t
    .wait(2000)
    .typeText('#usernameField', 'boobie@email.dk')
    .typeText('#passwordField', process.env.SECRET)
    
    .click("#loginButton.login-button")
    
    .wait(5000)
    .click("#historyButton")
    .wait(1000)

    .expect(Selector('#historyHeadline').exists).ok()
});

test('Login and logout', async t => {
    await t
    .typeText('#usernameField', 'boobie@email.dk')
    .typeText('#passwordField', process.env.SECRET)
    
    .click("#loginButton.login-button")
    .wait(3000)

    .click("#logoutButton")
    .wait(2000)

    .expect(Selector('#loginButton').exists).ok()
});
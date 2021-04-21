describe('Test spec 1', () => {

    it('Load test website', () => {
        browser.url('https://www.volvocars.com/intl/v/car-safety/a-million-more')
        browser.pause(2000)
        const accept = $('body > div.optanon-alert-box-wrapper > div.optanon-alert-box-bg > div.optanon-alert-box-button-container > div.optanon-alert-box-button.optanon-button-allow > div > button')
        accept.waitForExist()
        accept.click()
        browser.pause(3000)
        expect(browser).toHaveTitle('A million more | Volvo Cars')
    });

    it('H2 should be visible', () => {
        const h2 = $('h2')
        expect(h2).toBeVisible()
    });
    
});
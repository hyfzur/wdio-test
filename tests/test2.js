describe('Test spec 2', () => {

    it('Get text of H2 header ', () => {
        browser.url('https://www.volvocars.com/intl/v/car-safety/a-million-more')
        const accept = $('body > div.optanon-alert-box-wrapper > div.optanon-alert-box-bg > div.optanon-alert-box-button-container > div.optanon-alert-box-button.optanon-button-allow > div > button')
        accept.waitForExist()
        accept.click()
        browser.pause(3000)
        const h2 = $('h2')
        const text = h2.getText()
        h2.waitForExist()
        expect(text).toBe('Idea that change the world are often the most controversial.')
    });

    it('Check link value', () => {
        const link = $('#IconCallouts-1 > section > div > div.ay.bx.by.bz.co.dl.gn.go.gp.q.r > div > a')
        link.waitForExist()
        expect(link).toHaveLink('https://www.volvocars.com/intl/v/car-safety')
        link.click()
    });
    


});
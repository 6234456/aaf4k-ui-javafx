package eu.qiou.aaf4k.html

import eu.qiou.aaf4k.reportings.base.Account
import eu.qiou.aaf4k.reportings.base.AccountingFrame
import eu.qiou.aaf4k.reportings.base.CollectionAccount
import org.junit.Test

class ToHtmlKtTest {

    @Test
    fun toHtml() {
        CollectionAccount(123L, "Demo").apply {
            add(Account(223, "show", 1000004))
            add(Account(22332, "show23", 12000099))
            add(Account(223311, "show24", 12000000))
            add(Account(22332, "show22", 12000000))
            add(Account(22333, "show12", 12000000))
            add(Account(22334, "show3", 12000000))
        }.toHtml("1.html")
    }

    @Test
    fun toHtml1() {
        AccountingFrame
            .inflate(
                123L, "CAS1",
                this.javaClass.classLoader.getResourceAsStream("data/cn/cn_cas1_2018.txt")
            )
            .toReporting().toHtml("1.html")
    }
}
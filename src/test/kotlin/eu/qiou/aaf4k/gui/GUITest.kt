package eu.qiou.aaf4k.gui

import eu.qiou.aaf4k.reportings.base.AccountingFrame
import org.junit.Test
import java.util.*

class GUITest {

    @Test
    fun start() {
        GUI.locale = Locale.GERMAN
        GUI.open(AccountingFrame
            .inflate(
                123L, "CAS1",
                this.javaClass.classLoader.getResourceAsStream("data/cn/cn_cas1_2018.txt")
            )
            .toReporting().apply {
                prepareConsolidation()
            }
        )
    }
}
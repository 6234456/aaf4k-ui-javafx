package eu.qiou.aaf4k.html

import eu.qiou.aaf4k.reportings.base.ProtoAccount
import freemarker.template.Configuration
import java.io.File
import java.io.OutputStreamWriter

fun ProtoAccount.toHtml(
    path: String
) {
    val out = OutputStreamWriter(File(path).outputStream())
    Configuration(Configuration.VERSION_2_3_30).apply {
        val tpl = this.javaClass.classLoader.getResource("template").path

        setDirectoryForTemplateLoading(File(tpl))
        defaultEncoding = "UTF-8"
        logTemplateExceptions = false
    }.getTemplate("reporting.ftl").process(mapOf("acc" to this), out)

    out.flush()
    out.close()
}
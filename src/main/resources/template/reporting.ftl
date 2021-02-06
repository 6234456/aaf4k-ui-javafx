<#setting number_format=",##0.00">

<#macro dump acc0 n>
    <#if acc0.isAggregate() >
        <tr class="collection-account" data-level="${n}">
            <td class="text-left" style="text-indent: ${n*5}%">${acc0.id?string["#"]}</td>
            <td class="text-left" style="text-indent: ${n*5}%">${acc0.name}</td>
            <td class="text-right">€ ${acc0.displayValue}</td>
        </tr>
        <#list acc0.subAccounts as a>
            <@dump a n+1/>
        </#list>
    <#else>
        <tr class="atomic-account" data-level="${n}">
            <td class="text-left" style="text-indent: ${n*5}%">${acc0.id?string["#"]}</td>
            <td class="text-left" style="text-indent: ${n*5}%">${acc0.name}</td>
            <td class="text-right" style="text-indent: ${n*5}%">€ ${acc0.displayValue}</td>
        </tr>
    </#if>
</#macro>


<html lang="de">
<head>
    <meta charset="utf-8"/>
    <title>Data-Table</title>
    <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">

    <style>

        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

        body {
            font-family: "Roboto", helvetica, arial, sans-serif;
            font-size: 16px;
            font-weight: 400;
            text-rendering: optimizeLegibility;
        }

        .ausblenden {
            display: none;
        }

        /*** Table Styles **/

        .table-fill {
            background: white;
            border-radius: 3px;
            border-collapse: collapse;
            height: 320px;
            margin: auto;
            max-width: 95%;
            padding: 5px;
            width: 100%;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            animation: float 5s infinite;
        }

        th {
            color: #D5DDE5;;
            background: #1b1e24;
            border-bottom: 4px solid #9ea7af;
            border-right: 1px solid #343a45;
            font-size: 23px;
            font-weight: 100;
            padding: 24px;
            text-align: left;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            vertical-align: middle;
        }

        th:first-child {
            border-top-left-radius: 3px;
        }

        th:last-child {
            border-top-right-radius: 3px;
            border-right: none;
        }

        tr {
            border-top: 1px solid #C1C3D1;
            border-bottom: 1px solid #C1C3D1;
            color: #666B85;
            font-size: 16px;
            font-weight: normal;
            text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
        }

        tr:hover td {
            background: #4E5066;
            color: #FFFFFF;
            border-top: 1px solid #22262e;
        }

        tr:first-child {
            border-top: none;
        }

        tr:last-child {
            border-bottom: none;
        }

        tr:nth-child(odd) td {
            background: #EBEBEB;
        }

        tr:nth-child(odd):hover td {
            background: #4E5066;
        }

        tr:last-child td:first-child {
            border-bottom-left-radius: 3px;
        }

        tr:last-child td:last-child {
            border-bottom-right-radius: 3px;
        }

        td {
            background: #FFFFFF;
            padding: 20px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 18px;
            text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
            border-right: 1px solid #C1C3D1;
        }

        td:last-child {
            border-right: 0px;
        }

        th.text-left {
            text-align: left;
        }

        th.text-center {
            text-align: center;
        }

        th.text-right {
            text-align: right;
        }

        td.text-left {
            text-align: left;
        }

        td.text-center {
            text-align: center;
        }

        td.text-right {
            text-align: right;
        }

    </style>

</head>

<body>
<table class="table-fill">
    <thead>
    <tr>
        <th class="text-left">Nr.</th>
        <th class="text-left">Name</th>
        <th class="text-right">Betrag</th>
    </tr>
    </thead>
    <tbody class="table-hover">
    <@dump acc 0/>
    </tbody>
</table>


<script>
    let last_level = 0;
    document.querySelectorAll(".collection-account").forEach(
        e => {
            let level = parseInt(e.getAttribute("data-level"));
            e.addEventListener("click", function () {
                if (level === 0) {
                    document.querySelectorAll(".table-hover > tr").forEach(
                        x => {
                            x.classList.remove("ausblenden")
                        }
                    );
                } else {
                    document.querySelectorAll(".table-hover > tr").forEach(
                        x => {
                            if (level < parseInt(x.getAttribute("data-level"))) {

                                x.classList.add("ausblenden");
                            }
                        }
                    )
                }
            });

            last_level = level;
        }
    )

</script>
</body>
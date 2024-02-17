<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="icon" sizes="" href="https://yt3.ggpht.com/a-/AN66SAzzGZByUtn6CpHHJVIEOuqQbvAqwgPiKy1RTw=s900-mo-c-c0xffffffff-rj-k-no" type="image/jpg" />
        <title>Nofication</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style>
            body {
                background-color: #f0f0f0;
                font-family: Arial, sans-serif;
                color: #404040;
            }

            .center {
                text-align: center;
            }

            .tight {
                padding: 15px 30px;
            }

            td {
                padding: 20px 50px 30px 50px;
            }

            td.notification {
                padding: 10px 50px 30px 50px;
            }

            small,
            .small {
                font-size: 12px;
            }

            .footer {
                padding: 15px 30px;
            }

            .footer p {
                font-size: 12px;
                margin: 0;
                color: #606060;
            }

            a,
            a:hover,
            a:visited {
                color: #000000;
                text-decoration: underline;
            }

            h1,
            h2 {
                font-size: 22px;
                color: #404040;
                font-weight: normal;
            }

            p {
                font-size: 15px;
                color: #606060;
            }

            .general {
                background-color: white;
            }

            .notification h1 {
                font-size: 26px;
                color: #000000;
                font-weight: normal;
            }

            .notification p {
                font-size: 18px;
            }

            .notification p.small {
                font-size: 14px;
            }

            .icon {
                width: 32px;
                height: 32px;
                line-height: 32px;
                display: inline-block;
                text-align: center;
                border-radius: 16px;
                margin-right: 10px;
            }

            .failure {
                border-top: 20px #b02020 solid;
                background-color: #db9c9b;
            }

            .critical {
                border-top: 20px #c05050 solid;
                background-color: #e2afae;
            }

            .warning {
                border-top: 20px #c08040 solid;
                background-color: #e0c4aa;
            }

            .healthy {
                border-top: 20px #80c080 solid;
                background-color: #c6e2c3;
            }

            .information {
                border-top: 20px #50a0c0 solid;
                background-color: #b5d5e2;
            }

            .failure p {
                color: #3d120f;
            }

            .critical p {
                color: #3d211f;
            }

            .warning p {
                color: #44311c;
            }

            .healthy p {
                color: #364731;
            }

            .information p {
                color: #273c47;
            }

            .failure .icon {
                background-color: #b02020;
                color: #ffffff;
            }

            .critical .icon {
                background-color: #c05050;
                color: #ffffff;
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            }

            .warning .icon {
                background-color: #c08040;
                color: #ffffff;
                font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            }

            .healthy .icon {
                background-color: #80c080;
                color: #ffffff;
            }

            .information .icon {
                background-color: #50a0c0;
                color: #ffffff;
                font-family: Georgia, "Times New Roman", Times, serif;
                font-style: italic;
            }

            .content {
                width: 600px;
            }

            @media only screen and (max-width: 600px) {
                .content {
                    width: 100%;
                }
            }

            @media only screen and (max-width: 400px) {
                td {
                    padding: 15px 25px;
                }

                h1,
                h2 {
                    font-size: 20px;
                }

                p {
                    font-size: 13px;
                }

                small,
                .small {
                    font-size: 11px;
                }

                td.notification {
                    text-align: center;
                    padding: 10px 25px 15px 25px;
                }

                .notification h1 {
                    font-size: 22px;
                }

                .notification p {
                    font-size: 16px;
                }

                .notification p.small {
                    font-size: 12px;
                }

                .icon {
                    display: block;
                    margin: 0 auto 10px auto;
                }
            }
        </style>
    </head>

    <body style="margin: 0; padding: 0">
        <table style="border: none" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td style="padding: 15px 0">
                    <table style="border: none; margin-left: auto; margin-right: auto" cellpadding="0" cellspacing="0" width="600" class="content">
                        <!-- Start: Small header text in pale grey email background -->
                     
                        <!-- End: Small header text in pale grey email background -->

                        <!-- Start: White block with text content -->
                        <tr>
                            <td class="general center">
                                <h1>Nofication</h1>  
                            </td>
                        </tr>
                        <!-- End: White block with text content -->

                        <!-- Start: Failure Notification -->
                        <tr>
                            <td class="failure notification">
                                <h1><span class="icon">&times;</span>Complain</h1>
                                <p class="small">Any supplementary information</p>
                            </td>
                        </tr>
                        <!-- End: Failure Notification -->

                        <!-- Start: Warning Notification -->
                        <tr>
                            <td class="warning notification">
                                <h1><span class="icon">&quest;</span>Warning</h1>
                                <p class="small">You just change password</p>
                            </td>
                        </tr>
                        <!-- End: Warning Notification -->

                        <!-- Start: Healthy Notification -->
                        <tr>
                            <td class="healthy notification">
                                <h1><span class="icon">&check;</span>Verify Transaction</h1>
                                <p class="small">You have just completed the transaction</p>
                            </td>
                        </tr>
                        <!-- End: Healthy Notification -->

                        <!-- Start: Information Notification -->
                        <tr>
                            <td class="information notification">
                                <h1><span class="icon">i</span>Information</h1>
                                <p>The "something or other" system information</p>
                                <p class="small">Any supplementary information</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>

</html>
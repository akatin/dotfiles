# require [ "body", "fileinto", "imapflags", "reject" ];
require [ "body", "fileinto", "reject" ];

# To/Ccに宛先を記載して配布しているメルマガを最初にフォルダへ
if anyof
(
 header :contains "Subject" "【Keypoint Intelligence及び印刷業界ニュース】"
)
{
 fileinto "Info.News";
}
elsif anyof
(
 header :contains "Subject" "商業印刷情報Watch"
)
{
 fileinto "Info.News";
}
#
# JIRA/ConfluenceもToで送ってくる
#
elsif allof
(
 header :contains "Subject" "BSLM",
 header :contains "From" "sys-xptjira-notify"
)
{
 fileinto "Notifications.BSLM";
}
elsif anyof
(
 allof (header :contains "Subject" "[confluence]",
        header :contains "Subject" "requested"),
 allof (header :contains "Subject" "created",
        header :contains "Subject" "calendar"),
 header :contains "Subject" "USERADD",
 header :contains "Subject" "[JIRA][MKT",
 header :contains "Subject" "クラウド環境検討",
 header :contains "Subject" "Reminders",
 header :contains "Subject" "mentioned",
 header :contains "Subject" "Recommended"
)
{
 keep;
}
elsif anyof
(
    header :contains "From" "NTwareSupportTeam@nt-ware.com",
    header :contains "From" "noreply@sri.uniflowonline.com",
    header :contains "From" "noreply@jp.uniflowonline.com"
)
{
 fileinto "Notifications.uniFLOW";
}
elsif anyof
(
 allof (header :contains "Subject" "HW2",
	header :contains "From" "sys-xptjira-notify@")
)
{
 fileinto "Notifications.HW2";
}
elsif anyof
(
 allof (header :contains "Subject" "Rainbow-canon",
	header :contains "From" "sys-xptjira-notify@")

)
{
 fileinto "Notifications.Rainbow-canon";
}
elsif anyof
(
 header :contains "From" "sys-xptjira-notify",
    header :contains "From" "HipChat"
)
{
 fileinto "Notifications.HipChat";
}
elsif allof
(
 header :contains "From" "sys_wisdom@list.canon.co.jp",
 body :text :contains "PRISMAsync"
)
{
 fileinto "Projects.SysDev.wisdom-PRISMA";
}
elsif anyof
(
 header :contains "From" "sys_wisdom@list.canon.co.jp",
    address :contains ["To", "Cc"] "sys_wisdom@mail.canon"
)
{
 fileinto "Projects.SysDev.wisdom";
}
#
# 自分宛はフォルダに入れない
#
elsif anyof
(
    address :contains ["To", "Cc"] "akashi.masamichi@mail.canon",
    address :contains ["To", "Cc"] "akashi.masamichi@canon.co.jp"
)
{
 keep;
}
elsif anyof
(
 header :contains "X-ML-Name" "con-d_renkei@list.canon.co.jp",
    address :contains ["To", "Cc"] "con-d_renkei@mail.canon"
)
{
 fileinto "Projects.d_renkei";
}
elsif anyof
(
    header :contains "X-ML-Name" "cus-oip-kosugi-dev-all@list.canon.co.jp",
    header :contains "X-ML-Name" "cus-oip-kosugi-all@list.canon.co.jp",
    header :contains "X-ML-Name" "cus-oip-toride-dpm-haken-all@list.canon.co.jp",
    header :contains "X-ML-Name" "d077@list.canon.co.jp",
    header :contains "X-ML-Name" "d039@list.canon.co.jp",
    address :contains ["To", "Cc"] "d039@mail.canon"

)
{
  fileinto "Division.Center";
}
elsif anyof
(
    header :contains "X-ML-Name" "I010@list.canon.co.jp",
    address :contains ["To", "Cc"] "I010@mail.canon"
)
{
  fileinto "Division.OIP";
}
elsif anyof
(
 header :contains "X-ML-Name" "cus-oip-kawasaki-dev-all@list.canon.co.jp",
 header :contains "X-ML-Name" "cus-oip-kk-all@list.canon.co.jp",
 header :contains "X-ML-Name" "cus-oip-toride-dpm-all@list.canon.co.jp",
 header :contains "X-ML-Name" "d072@list.canon.co.jp",
 header :contains "X-ML-Name" "d035@list.canon.co.jp",
 header :contains "X-ML-Name" "cus-oip-kawa-dev-all@list.canon.co.jp",
 header :contains "X-ML-Name" "cus-oip-kawa-all@list.canon.co.jp",
    address :contains ["To", "Cc"] "cus-oip-kawa-all@mail.canon",
    address :contains ["To", "Cc"] "cus-oip-kawa-all@mail.canon"
)
{
 fileinto "Division.KosugiAll";
}
elsif anyof
(
    header :contains "X-ML-Name" "b039@list.canon.co.jp",
    header :contains "X-ML-Name" "b381@list.canon.co.jp",
    header :contains "X-ML-Name" "b311@list.canon.co.jp",
    header :contains "X-ML-Name" "b134@list.canon.co.jp",
    header :contains "X-ML-Name" "con-b381tams@list.canon.co.jp",
    header :contains "X-ML-Name" "con-oip-sys-9div@list.canon.co.jp",
    address :contains ["To", "Cc"] "aaab381@mail.canon",
    address :contains ["To", "Cc"] "con-b381@mail.canon"
)
{
 fileinto "Division.Bu";
}
elsif anyof
(
    header :contains "X-ML-Name" "con-4770@list.canon.co.jp",
    header :contains "X-ML-Name" "4770@list.canon.co.jp",
    header :contains "X-ML-Name" "2358@list.canon.co.jp",
    header :contains "X-ML-Name" "2300@list.canon.co.jp",
    header :contains "X-ML-Name" "2300@list.canon.co.jp",
    header :contains "X-ML-Name" "2368@list.canon.co.jp",
    header :contains "X-ML-Name" "con-2358w-all@list.canon.co.jp",
    header :contains "X-ML-Name" "con-2358w@list.canon.co.jp",
    address :contains ["To", "Cc"] "con-2358w@mail.canon",
    address :contains ["To", "Cc"] "con-2358w-all@mail.canon",
    address :contains ["To", "Cc"] "aaa2358@mail.canon"
)
{
 fileinto "Division.Heya";
}
elsif anyof
(
 header :contains "X-ML-Name" "con-dsta-manager@list.canon.co.jp"
)
{
 fileinto "Division.Heya-mng";
}
elsif anyof
(
 header :contains "X-ML-Name" "m_dis@list.canon.co.jp"
)
{
 fileinto "Division.m_dis";
}
elsif anyof
(
 header :contains "X-ML-Name" "sys11-2014-rd@list.canon.co.jp",
 header :contains "X-ML-Name" "sys11-2015-rd@list.canon.co.jp",
 header :contains "X-ML-Name" "b381-pga2016@list.canon.co.jp"
)
{
 fileinto "Division.PGA";
}
elsif anyof
(
 address :contains ["To", "Cc"] "b381-pga2016-mgt@list.canon.co.jp"
)
{
 fileinto "Division.PGA-mgt";
}
elsif anyof
(
 header :contains "X-ML-Name" "con-snk381@list.canon.co.jp"
)
{
 fileinto "Division.SNK";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-gk15psui@list.canon.co.jp",
 header :contains "X-ML-Name" "prj-sys11-cms@list.canon.co.jp"
)
{
 fileinto "Division.&YoCIU1KbXzdTFg-";
}

elsif anyof
(
 header :contains "X-ML-Name" "con-kaetai@list.canon.co.jp"
)
{
 fileinto "Division.Kaetai";
}
elsif anyof
(
    header :contains "X-ML-Name" "pbsc-wf-gawf@list.canon.co.jp",
    address :contains ["To", "Cc"] "pbsc-wf-gawf@mail.canon"
)
{
 fileinto "PBSC.GAWF";
}
elsif anyof
(
    header :contains "X-ML-Name" "pbsc-wf-serviceportal@list.canon.co.jp",
    address :contains ["To", "Cc"] "pbsc-wf-serviceportal@mail.canon"
)
{
 fileinto "PBSC.ServicePortal";
}
elsif anyof
(
 header :contains "X-ML-Name" "pp-serviceportal-internal@list.canon.co.jp"
)
{
 fileinto "PBSC.ServicePortal-Internal";
}
elsif anyof
(
    header :contains "X-ML-Name" "pbsc-wf-qa@list.canon.co.jp",
    address :contains ["To", "Cc"] "pbsc-wf-qa@mail.canon"
)
{
 fileinto "PBSC.wf-qa";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-rainbow@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-rainbow@mail.canon"
)
{
 fileinto "Projects.Rainbow";
}
elsif anyof
(
    header :contains "X-ML-Name" "a388-mauve@list.canon.co.jp",
    address :contains ["To", "Cc"] "a388-mauve@mail.canon"
)
{
 fileinto "Projects.Rainbow.Mauve";
}
elsif anyof
(
 header :contains "X-ML-Name" "a394-sunglow@list.canon.co.jp"
)
{
 fileinto "Projects.Rainbow.Sunglow";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-aik@list.canon.co.jp"
)
{
 fileinto "Projects.Rainbow.aik";
}
elsif anyof
(
    address :contains ["To", "Cc"] "prj-iprelease@mail.canon",
    address :contains ["To", "Cc"] "prj-iprelease@list.canon.co.jp"
)
{
 fileinto "Projects.SysDev.IPrelease";
}elsif anyof
(
    header :contains "X-ML-Name" "cl-soft@list.canon.co.jp",
    address :contains ["To", "Cc"] "cl-soft@mail.canon"
)
{
# setflag "\\Seen";
 fileinto "Projects.SysDev.cl-soft";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-a388sys@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-a388sys@mail.canon"
)
{
 fileinto "Projects.SysDev.prj-a388sys";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-a394sys@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-a394sys@mail.canon"
)
{
 fileinto "Projects.SysDev.prj-a394sys";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-e314sys@list.canon.co.jp"
)
{
 fileinto "Projects.SysDev.prj-e314sys";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-nada-bw-soft@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-nada-bw-soft@mail.canon"

)
{
 fileinto "Projects.SysDev.prj-nada-bw-soft";
}
elsif anyof
(
    header :contains "X-ML-Name" "xpt2-v3@list.canon.co.jp",
    address :contains ["To", "Cc"] "xpt2-v3@mail.canon"
)
{
 fileinto "Projects.SysDev.xpt2-v3";
}
elsif anyof
(
 header :contains "Subject" "Highend個別システム仕様検討会"
)
{
 fileinto "Projects.SysDev.HighendSpec";
}

elsif anyof
(
 header :contains "X-ML-Name" "org-ac-if@list.canon.co.jp"
)
{
 fileinto "Projects.SysDev.org-ac-if";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-devaccer@list.canon.co.jp"
)
{
 fileinto "Projects.SysDev.prj-devaccer";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-smodeui@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-smodeui@mail.canon",
    header :contains "Subject" "サービスコード申請システム"
)
{
 fileinto "Projects.SysDev.SmodeUI";
}
elsif anyof
(
 header :contains "X-ML-Name" "con-oce-aap-product@list.canon.co.jp"
)
{
 fileinto "Projects.Oce.AAP";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-e388@list.canon.co.jp"
)
{
 fileinto "Projects.Engine.A388PQR";
}
elsif anyof
(
    header :contains "X-ML-Name" "sup-c800s@list.canon.co.jp",
    address :contains ["To", "Cc"] "sup-c800s@mail.canon"

)
{
 fileinto "Projects.Engine.A388";
}
elsif anyof
(
    header :contains "X-ML-Name" "sup-10000_engine@list.canon.co.jp",
    address :contains ["To", "Cc"] "sup-ipr_c10000vp@mail.canon",
    header :contains "X-ML-Name" "sup-ipr_c10000vp@list.canon.co.jp"
)
{
 fileinto "Projects.Engine.A394";
}
elsif anyof
(
    header :contains "X-ML-Name" "sup-ij-kosobako@list.canon.co.jp",
    address :contains ["To", "Cc"] "sup-ij-kosobako@mail.canon"
)
{
 fileinto "Projects.Engine.E314";
}
elsif anyof
(
 header :contains "X-ML-Name" "sup-sunglow_engine@list.canon.co.jp"
)
{
 fileinto "Projects.Rainbow.Sunglow.sup-sunglow";
}
elsif anyof
(
 header :contains "X-ML-Name" "sup-kyoyu@list.canon.co.jp"
)
{
 fileinto "Projects.Gihyo.sup-kyoyu";
}
elsif anyof
(
 header :contains "X-ML-Name" "0ji_commu@list.canon.co.jp",
    address :contains ["To", "Cc"] "0ji_commu@mail.canon"
)
{
 fileinto "Projects.Gihyo.0ji_commu";
}
elsif anyof
(
 header :contains "X-ML-Name" "con-verify@list.canon.co.jp"
)
{
 fileinto "Projects.Gihyo.con-verify";
}
elsif anyof
(
    header :contains "X-ML-Name" "con-image-pro@list.canon.co.jp",
    address :contains ["To", "Cc"] "con-image-pro@mail.canon"
)
{
 fileinto "Projects.Gihyo.image-pro";
}
elsif anyof
(
 header :contains "X-ML-Name" "print-connoisseur@list.canon.co.jp"
)
{
 fileinto "Projects.Gihyo.print-connoisseur";
}
elsif anyof
(
 header :contains "X-ML-Name" "new-mfpsystems-concept@list.canon.co.jp"
)
{
 fileinto "Projects.new-mfpsystems-concept";
}
elsif anyof
(
 header :contains "X-ML-Name" "midplan_ds2017pp@list.canon.co.jp"
)
{
 fileinto "Projects.midplan_ds2017pp";
}
elsif anyof
(
 header :contains "X-ML-Name" "toride-showroom@list.canon.co.jp"
)
{
 fileinto "Projects.Toride-ShowRoom";
}
elsif anyof
(
 header :contains "X-ML-Name" "midplan_podwf_2018@list.canon.co.jp",
 header :contains "X-ML-Name" "midplan_podwf_2019@list.canon.co.jp"

)
{
 fileinto "Projects.midplan_podwf";
}
elsif anyof
(
 header :matches "Subject" "[prob]*A388_4_0*"
)
{
 fileinto "ProB.A388JuneVup";
}
elsif anyof
(
 header :matches "Subject" "[prob]*A388P_1_0*"
)
{
 fileinto "ProB.A388PQR";
}
elsif anyof
(
 header :matches "Subject" "[prob]*A394_-1_0*"
)
{
}
elsif anyof
(
 header :contains "X-ML-Name" "senior_imager@list.canon.co.jp"
)
{
 fileinto "Projects.Imaging.senior_imager";
}
elsif anyof
(
 header :contains "X-ML-Name" "0ji-review@list.canon.co.jp"
)
{
 fileinto "Projects.Gihyo.0ji";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-sys-tashaki@list.canon.co.jp"
)
{
 fileinto "Projects.Gihyo.sys-tashaki";
}
elsif anyof
(
 header :contains "To" "oip_marketnews@list.canon.co.jp"
)
{
 fileinto "Info.News";
}
elsif anyof
(
 header :contains "X-ML-Name" "con-gisuikan@list.canon.co.jp"
)
{
 fileinto "Info.Gisuikan";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-sys-bli-report@list.canon.co.jp"
)
{
 fileinto "Info.BLI-report";
}
elsif anyof
(
 header :contains "Subjects" "MIP"
)
{
 fileinto "Info.MIP";
}
elsif anyof
(
 header :contains "X-ML-Name" "dpwg@list.canon.co.jp"
)
{
 fileinto "Info.dpwg";
}
elsif anyof
(
    header :contains "X-ML-Name" "agile-core@list.canon.co.jp",
    address :contains ["To", "Cc"] "agile-core@mail.canon"
)
{
 fileinto "Agile.AgileCore";
}
elsif anyof
(
    header :contains "X-ML-Name" "arc-agile@list.canon.co.jp",
    address :contains ["To", "Cc"] "arc-agile@mail.canon"
)
{
 fileinto "Agile.Arc-Agile";
}
elsif anyof
(
    header :contains "X-ML-Name" "cist_agile@list.canon.co.jp",
    address :contains ["To", "Cc"] "cist_agile@mail.canon"
)
{
 fileinto "Agile.cist-agile";
}
elsif anyof
(
 header :contains "Subject" "MIPメルマガ"
)
{
 fileinto "Projects.MIP";
}
elsif anyof
(
    header :contains "X-ML-Name" "prj-tkm_bslm@list.canon.co.jp",
    address :contains ["To", "Cc"] "prj-tkm_bslm@mail.canon"
)
{
 fileinto "Projects.BSLM";
}
elsif anyof
(
 header :contains "X-ML-Name" "calsok@list.canon.co.jp"
)
{
 fileinto "Projects.CALSOK";
}
elsif anyof
(
 header :contains "X-ML-Name" "stdif-wg@list.canon.co.jp"
)
{
 fileinto "Projects.StdIF-wg";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-uniflow-online@list.canon.co.jp"
)
{
 fileinto "Projects.uniFLOW-online";
}
elsif anyof
(
 header :contains "X-ML-Name" "prj-toride_demo_2018@list.canon.co.jp"
)
{
 fileinto "Projects.KaichoDemo";
}
elsif anyof
(
 header :contains "X-ML-Name" "ppwf-oip@list.canon.co.jp"
)
{
 fileinto "Projects.ppwf-oip";
}
elsif anyof
(
    header :contains "X-ML-Name" "pbsc-wf-gawf@list.canon.co.jp",
    address :contains ["To", "Cc"] "pbsc-wf-gawf@mail.canon"
)
{
 fileinto "PBSC.GAWF";
}
elsif anyof
(
    header :contains "X-ML-Name" "con-d_renkei@list.canon.co.jp",
    address :contains ["To", "Cc"] "con-d_renkei@mail.canon"
)
{
 fileinto "Projects.d_renkei";
}
elsif anyof
(
    header :contains "Subject" "[dc2019"
)
{
 fileinto "Agile.DC2019";
}

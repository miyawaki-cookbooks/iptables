iptables Cookbook
=================
CentOS 6でiptablesのport filterを設定するCookbook.  
CentOS 6では、firewallの設定がデフォルト有効であるため、必要なサービス用のfilterを空けるために使用できる。  
ただしssh(port=22/tcp)については、このCookbookでは無条件に有効にしているため、記述の必要はない。  

※今のところサポートしているポートはtcpだけである。(udpが必要になった場合は、Cookbookの改修が必要)
※これ以上の機能が必要な場合は、opscodeのiptablesを使用のこと。

Requirements
------------
CentOS 6.5で動作確認済み。(centosを前提としているため、互換性のある環境だけで動作するはず。ohaiの値をチェックしていない）

###依存パッケージ
なし。


Attributes
----------

* `iptables['name'][port]`
    - portだけが使用される。nameはダミー。メモ。
    - 複数のportを有効にする場合は、配列として設定する。
    - デフォルト値はない。

Usage
-----
run_listに必要なCookbookとともに記述する。
defaultのrecipeはないので、iptablesのrecipeを使用する。

### 設定例：

    # web.rbの抜粋
    override_attributes  "iptables" => { "http" => "80",
                                    "https" => "443"
                                  },
    "java" => 
      { "install_flavor" => "oracle",
        "jdk_version"=> 7,
        "java_home"=> "/usr/local/java",
        "oracle" => { "accept_oracle_download_terms" => true }
      },
        :
      (中略)
        :
      # -- recipe --
     run_list "recipe[iptables::iptables]",
              "recipe[apache2]",
              "recipe[java]",
              "recipe[tomcat]",
              "recipe[postgresql]",
              "recipe[pgstudio]"


License and Authors
-------------------
Authors:: YAMAMOTO,Miyawaki,Tamie.

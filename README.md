# ltsvbox cookbook

{Labeled Tab Separated Value}[http://stanaka.hatenablog.com/entry/2013/02/05/214833]を試したときの vagrant 用 chef レシピ。

* nginx
* td-agent
* perlbrew
* growthforecast
* supervisord

をセットアップして nginx が LTSV でログを吐きます。そのログを td-agent が {fluent-plugin-tail-labeled-tsv}[https://github.com/stanaka/fluent-plugin-tail-labeled-tsv] で読み込んで、レスポンス時間とステータスコードの統計を growthorecast に投げます。

何かの役に立つことを目的としたわけではなくchef-solo でそのような環境を構築するためのサンプルにでもなれば、というレポジトリです。

# Requirements

* Vagrant
* Berlshelf

# Usage

    $ cd vagrant-ltsvbox
    $ vagrant up

# Attributes

# Recipes

# Author

Author:: Naoya Ito (<i.naoya@gmail.com>)

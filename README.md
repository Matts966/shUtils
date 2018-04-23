# shUtils
bash scripts.


## autoJarReportExporterForJava.sh
1. 授業の命名規則に則って、```reportxx-xx-xxxxxx```というディレクトリを作成。
2. ```reportxx-xx-xxxxxx```内にレポート用HTMLと、Javaファイルを配置。
3. 好きな場所で```sh autoJarReportExporterForJava.sh the/path/to/reportxx-xx-xxxxxx```を実行
4. ```reportxx-xx-xxxxxx```内に提出用jarファイルが生成される。
- wkhtmltopdfが必要。

## latexAutoJarReportExporterForJava
1. 授業の命名規則に則って、```reportxx-xx-xxxxxx```というディレクトリを作成。```reportxx-xx-xxxxxx.tex```のファイル名を書き換える。
2. ```reportxx-xx-xxxxxx.tex```ファイル内の氏名や変数を書き換え。
3. Javaファイルと```reportxx-xx-xxxxxx.tex```を```reportxx-xx-xxxxxx```に配置。
4. 好きな場所で```sh autoJarReportExporterForJavaAndLatex.sh the/path/to/reportxx-xx-xxxxxx```を実行
5. ```reportxx-xx-xxxxxx```内に提出用jarファイルが生成される。
- latexコンパイル環境が必要。

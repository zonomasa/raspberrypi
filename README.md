raspberrypi
===========

Raspeberry PI で動作するプログラム集。


pi_tenki
--------

* その日の天気予報を教えてくれるXFD(eXtreme Feedback Device) を実現します。
* GPIO から制御可能なLEDを二つ必要とします。

* 使用方法

    $ sudo ruby pi_tenki.rb

* 結果
  * 当時の天気が雨の場合 GPIO 17 番に接続のLEDが点灯します。
  * 当時の天気が雨以外の場合 GPIO 27 番に接続のLEDが点灯します。
  * ※GPIO ポートはpi_tenki.rb 内の数値を変更することで、異なるポートを使用することができます。
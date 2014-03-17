# -*- coding: utf-8 -*-

$:.unshift File.dirname(__FILE__)  # ロードパスにカレントディレクトリを追加

require 'json'
require 'pi_led'

LED.off(17)
LED.off(24)
LED.off(27)

LED.blink(17)
LED.blink(24)
LED.blink(27)

tenki = JSON.parse!(`curl http://weather.livedoor.com/forecast/webservice/json/v1?city=130010`)["forecasts"][0]["telop"]

if /雨/ =~ tenki.to_s
  LED.on(17)
else
  LED.on(27)
end

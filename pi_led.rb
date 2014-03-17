# -*- coding: utf-8 -*-

module LED
  private
  def self.led_open(no)
    begin
      exp = open("/sys/class/gpio/export", "w")
      exp.write(no)
      exp.close
    rescue => err
      puts err
    end
  end

  def self.led_close(no)
    uexp = open("/sys/class/gpio/unexport", "w")
    uexp.write(no)
    uexp.close
  end

  def self.led_out(no)
    dir = open("/sys/class/gpio/gpio#{no}/direction", "w")
    dir.write("out")
    dir.close
  end

  public
  def blink10(no)
    led_open(no)
    led_out(no)
    out = 1
    10.times do
      val = open("/sys/class/gpio/gpio#{no}/value", "w")
      val.write(out)
      val.close
      out = out == 1 ? 0 : 1
      sleep 0.2
    end
    led_close(no)
  end

  def on(no)
    led_open(no)
    led_out(no)
    val = open("/sys/class/gpio/gpio#{no}/value", "w")
    val.write(1)
    val.close
    led_close(no)
  end

  def off(no)
    led_open(no)
    led_out(no)
    val = open("/sys/class/gpio/gpio#{no}/value", "w")
    val.write(0)
    val.close
    led_close(no)
  end
  module_function :on, :off, :blink10
end

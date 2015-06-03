# -*- coding: utf-8 -*-
require 'io/console'
require 'clipboard'

class Prompt
  def initialize
    @string = ''
    @ligatures = {
      %w(t h) => 'þ',
      %w(d h) => 'ð',
      %w(a e) => 'æ',
      %w(T H) => 'Þ',
      %w(D H) => 'Ð',
      %w(A E) => 'Æ'
    }
  end

  def copy_to_clipboard_and_exit
    Clipboard.copy @string
    exit
  end

  def add_letter(c)
    @string += c
  end

  def add_ligature(c)
    @string = @string[0..-2] + c
  end

  def check_ligature(c)
    key = [@string[-1], c]
    if @ligatures.key?(key)
      add_ligature(@ligatures[key])
    else
      add_letter(c)
    end
  end

  def input
    t1 = Time.now
    loop do
      c = $stdin.getch
      copy_to_clipboard_and_exit if c == '!'
      t2 = Time.now
      t2 - t1 < 0.1 ? check_ligature(c) : add_letter(c)
      puts @string
      t1 = t2
    end
  end
end

Prompt.new.input

#!/usr/bin/env ruby

class Machine
  RAMSIZE = 2046
	def get_orders
      [
       'まじ卍',
       'やばみ',
       'パリピ',
       'とりま',
       'おこだよ',
       'まじおこ',
			 '激おこぷんぷん丸',
       'ムカ着火ファイヤー',
			 'カム着火インフェルノォォォォオオウ',
       '激おこスティックファイナリアリティぷんぷんドリーム',
       'かまちょ',
       '微レ存',
			 '草不可避ww'
     ].join('|')
  end
  def initialize(file)
		orders = get_orders
		@ram = File.open(file).read.scan(/(#{orders})/).flatten
    @eoc = @ram.size
    @ram.fill(0, @eoc..RAMSIZE)
    @p = @eoc
    @pp = 0
  end
  def run
    case @ram[@pp]
    when 'まじ卍'; @p += 1
    when 'やばみ'; @p -= 1
    when 'パリピ'; @ram[@p] += 1
    when 'とりま'; @ram[@p] -= 1
    when 'おこだよ','まじおこ','激おこぷんぷん丸','ムカ着火ファイヤー','カム着火インフェルノォォォォオオウ','激おこスティックファイナリアリティぷんぷんドリーム'; putc @ram[@p]
    when 'かまちょ'; @ram[@p] = stdin.readchar
    when '微レ存'
      if (@ram[@p] == 0)
        while @ram[@pp] != '草不可避ww'
          @pp += 1
        end
      end
    when '草不可避ww'
      if (@ram[@p] != 0)
        while @ram[@pp] != '微レ存'
          @pp -= 1
        end
      end
    else
    end
    @pp += 1
  end
  def start
    while true
      self.run
      break if @pp > @eoc
    end
  end
end

vm = Machine.new(ARGV[0])
vm.start

class Task
  attr_reader :id, :title, :content
  attr_writer :id, :title, :content
  @@count = 0
  def initialize(title:, content:)
    @id = @@count += 1
    @title = title
    @content = content
  end

   def info
     "[No.#{@id}] #{@title}:#{@content}"
  end

end

class ToDo
  def initialize
    @tasks = []
  end
  def add(task)
    @tasks << task
    puts "【追加】#{task.info}"
  end

  def info
    puts "*=*=*=*=*=*=*=*=* task *=*=*=*=*=*=*=*=*"
      @tasks.each do |task|
        if task.info.empty?
          puts "【！】タスクはありません"
        else
          puts task.info
        end
      end
    puts "*=*=*=*=*=*=*=*=*=*=*=**=*=*=*=*=*=*=*=*"
  end

  def delete(id:)
    task = @tasks.find{ |task| task.id == id }
    if task.nil?
      puts "【！】 該当idのタスクはありません。"
    else
      @tasks.delete(task)
      puts "【削除】#{task.info}"
    end
  end
end

task1 = Task.new(title: "洗濯", content: "7時半までに干し終える")
task2 = Task.new(title: "仕事", content: "9時〜18時")
task3 = Task.new(title: "買い物", content: "卵, ヨーグルト")

todo = ToDo.new
todo.add(task1)
todo.add(task2)
todo.info
todo.delete(id: 1)
todo.add(task3)
todo.delete(id: 4)
todo.delete(id: 3)
todo.info



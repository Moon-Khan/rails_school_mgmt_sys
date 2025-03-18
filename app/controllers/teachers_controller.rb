class TeachersController <ApplicationController

    before_action :set_teacher, only: %i[ show edit update destroy ]

    def index
        @teacher = Teacher.all
    end

    def show
    end

    def new 
        @teacher = Teacher.new
    end

    def edit
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save
            redirect_to teachers_path, notice: "New teacher added!"
        else
            puts @teacher.errors.full_messages  
            render :new, status: :unprocessable_entity
        end
    end

    def update

        if @teacher.update(teacher_params)
            redirect_to @teacher, notice: "teacher updated"
        else
            puts @teacher.errors.full_messages  
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy

        if @teacher.destroy
            redirect_to teachers_path, notice: "teacher deleted"
        else
            puts @teacher.errors.full_messages  
            redirect_to index_teachers_path, alert: "Failed to delete teacher" 
        end
    end

    private 

    def teacher_params
        params.require(:teacher).permit(:name, :contact)
    end

    def set_teacher
        @teacher = Teacher.find(params[:id]) 
    end
    
end     

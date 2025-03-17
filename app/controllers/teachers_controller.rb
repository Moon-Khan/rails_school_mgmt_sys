class TeachersController <ApplicationController

    def index
        @teacher = Teacher.all
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def new
        @teacher = Teacher.new
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def create
        @teacher = Teacher.new(teacher_params)

        if @teacher.save
            redirect_to teachers_path, notice: "New teacher added!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @teacher = Teacher.find(params[:id])

        if @teacher.update(teacher_params)
            redirect_to @teacher, notice: "teacher updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy

        @teacher = Teacher.find(params[:id])

        if @teacher.destroy
            redirect_to teachers_path, notice: "teacher deleted"
       
        end
    end

    private 

    def teacher_params
        params.require(:teacher).permit(:name, :contact)
    end

    
end     

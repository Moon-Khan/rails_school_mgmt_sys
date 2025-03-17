class StudentsController <ApplicationController

    def index
        @student = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def edit
        @student = Student.find(params[:id])
    end

    def create
        @student = Student.new(student_params)

        if @student.save
            redirect_to @student, notice: "New student added!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @student = Student.find(params[:id])    

        if @student.update(student_params)
            redirect_to student_path(@student), notice: "Student updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy

        @student = Student.find(params[:id])

        if @student.destroy
            redirect_to students_path, notice: "Student deleted"

        else
            redirect_to students_path, alert: "Failed to delete student" 
        end
    end

    private 

    def student_params
        params.require(:student).permit(:name, :age, :email)
    end


end     

    class StudentsController <ApplicationController
        
        before_action :set_student, only: %i[ show edit update destroy ]

        def index
            @student = Student.all
        end

        def show
        end

        def new
            @student = Student.new
        end

        def edit
        end

        def create
            @student = Student.new(student_params)

            if @student.save
                redirect_to index_students_path, notice: "New student added!"
            else
                puts @student.errors.full_messages 
                render :new, status: :unprocessable_entity
            end
        end

        def update

            if @student.update(student_params)
                redirect_to student_path(@student), notice: "Student updated"
            else
                puts @student.errors.full_messages  
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy

            if @student.destroy
               
                redirect_to index_students_path, notice: "Student deleted"

            else
                puts @student.errors.full_messages  
                redirect_to index_students_path, alert: "Failed to delete student" 
            end
        end

        private 

        def student_params
            params.require(:student).permit(:name, :age, :email)
        end

        def set_student
            @student = Student.find(params[:id]) 
        end

    end     

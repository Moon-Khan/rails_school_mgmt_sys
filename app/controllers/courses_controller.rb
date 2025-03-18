class CoursesController <ApplicationController

    before_action :set_course, only: %i[ show edit update destroy ]

    def index
        @course = Course.all
    end

    def show
    end

    def new
        @course = Course.new
    end

    def edit
    end

    def create  
        @course = Course.new(course_params)

        if @course.save
            redirect_to index_courses_path, notice: "New course added!"
        else
            puts @course.errors.full_messages  
            render :new, status: :unprocessable_entity
        end
    end

    def update

        if @course.update(course_params)
            redirect_to course_path(@course), notice: "course updated"
        else
            puts @course.errors.full_messages  
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy

        if @course.destroy
            redirect_to index_courses_path, notice: "course deleted"
        
        else
            puts @course.errors.full_messages  
            redirect_to index_courses_path, alert: "Failed to delete courses" 
        end
    end

    private 

    def course_params
        params.require(:course).permit(:name, :description)
    end


    def set_course
        @course = Course.find(params[:id]) 
    end

    
end     

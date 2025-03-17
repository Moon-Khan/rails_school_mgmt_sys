class CoursesController <ApplicationController

    def index
        @course = Course.all
    end

    def show
        @course = Course.find(params[:id])
    end

    def new
        @course = Course.new
    end

    def edit
        @course = Course.find(params[:id])
    end

    def create
        @course = Course.new(course_params)

        if @course.save
            redirect_to courses_path, notice: "New course added!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @course = Course.find(params[:id])

        if @course.update(course_params)
            redirect_to @course, notice: "course updated"
    
        end
    end

    def destroy

        @course = Course.find(params[:id])

        if @course.destroy
            redirect_to courses_path, notice: "course deleted"
        else
            status: :unprocessable_entity
        end
    end

    private 

    def course_params
        params.require(:course).permit(:name, :description)
    end

    
end     

class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    session[:students_params] ||= {}
    @student = Student.new(session[:students_params])
    @student.current_step = session[:student_step]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    session[:students_params].deep_merge!(params[:student]) if params[:student]
    @student = Student.new(session[:students_params])
    @student.current_step = session[:student_step]
    if @student.valid?
      if params[:back_button]
        @student.previous_step
      elsif @student.last_step?
        @student.save if @student.all_valid?
      else
        @student.next_step
      end
      session[:student_step] = @student.current_step
    end
    if @student.new_record?
      render "new"
    else
      session[:student_step] = session[:students_params] = nil
      flash[:notice] = "Student saved!"
      redirect_to @student
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end
end

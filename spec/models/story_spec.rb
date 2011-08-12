require( 'spec_helper' )


describe( Story ) do
  describe( :estimated_time ) do
    before( :each ) do
      @story = Factory( :story )
      @task_1 = Factory( :task, :story => @story )
      @task_2 = Factory( :task, :story => @story )
    end

    it( 'should be sum of tasks estimated time' ) do
      sum = @task_1.estimated_time + @task_2.estimated_time
      @story.estimated_time.should == sum
    end
  end

  describe( :working_time ) do
    before( :each ) do
      @story = Factory( :story )
      @task_1 = Factory( :task, :story => @story )
      @task_2 = Factory( :task, :story => @story )
    end

    it( 'should be sum of tasks working time' ) do
      sum = @task_1.working_time + @task_2.working_time
      @story.working_time.should == sum
    end
  end
end

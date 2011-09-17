require File.join(File.dirname(__FILE__), 'helper')

class TimerTestCase < Test::Unit::TestCase

    def test_start
        timer = Timemaniac::Timer.new
        assert_equal 0, timer.status

        timer.start
        assert_equal 1, timer.status
    end

    def test_pause
        timer = Timemaniac::Timer.new
        assert_equal 0, timer.status 

        timer.start
        assert_equal 1, timer.status 

        timer.pause
        assert_equal 2, timer.status 
    end

    def test_stop
        timer = Timemaniac::Timer.new
        assert_equal 0, timer.status 

        timer.start
        assert_equal 1, timer.status 

        timer.stop
        assert_equal 3, timer.status
    end

    def test_get_elapsed_time
        timer = Timemaniac::Timer.new
        timer.start_date = Time.now - 3600
        timer.end_date = Time.now + 3600
        assert_equal 7200, timer.get_elapsed_time
    end

    def test_to_s
        timer = Timemaniac::Timer.new

        timer.expects(:get_elapsed_time).returns(3600)
        assert_equal '1h:0m:0s', timer.to_s

        timer.expects(:get_elapsed_time).returns(179110)
        assert_equal '2j 1h:45m:10s', timer.to_s

        timer.expects(:get_elapsed_time).returns(60)
        assert_equal '0h:1m:0s', timer.to_s

        timer.expects(:get_elapsed_time).returns(1)
        assert_equal '0h:0m:1s', timer.to_s
    end
end

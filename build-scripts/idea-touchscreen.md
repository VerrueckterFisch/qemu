# Touchscreen Ideas

### 2020.10.16

Currently there is no touchscreen support for this qemu gui. 
Following are some ideas of how to realize the touchscreen functionality


### Basic Idea of Touchscreen

* Using mouse click to represent finger touch
    * click: touch
    * release: untouch
* Record the `x` and `y` value, and the touch `status`
* Use `QemuInputHandler` to catch the mouse activity, and pass event to board

### To Be Clarified

* How to map touchscreen activity (`x`, `y`, `status`) to the GPIO?
* How to exactly implement hardware activity, driver, and board manipulation?
* Is it better to wait for the update of touchscreen support for 100ask-QEMU, instead of implementing that by self?






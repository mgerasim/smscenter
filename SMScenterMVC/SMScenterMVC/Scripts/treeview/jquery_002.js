(function ($) {
    //Return the options stored for this element
    var getOptions = function (element) {
        var options = element.data('options');

        if (options) {
            return options;
        }
        else {
            $.error('The element must be initialized first');
        }
    }

    // Set the promt text that will appear as the first value
    var setPromptText = function (element) {
        var defaultValue = getOptions(element).promptText;
        var option = new Option(defaultValue, '');
        element.append(option);
    }

    // Set the text that will appear if there is no data to display
    var setNoInfoText = function (element) {
        var options = getOptions(element);
        var noInfoElement = $('<span></span>').attr('id', 'noInfo_' + element.attr('id')).append(options.noInfoText);

        element.parent().append(noInfoElement);
    }

    // Toggle the noInfoText
    var toggleNoInfoText = function (element, visible) {
        var noInfoElement = $('#noInfo_' + element.attr('id'));
        var options = getOptions(element);

        if (visible) {
            noInfoElement.show();
            element.hide();
        }
        else {
            noInfoElement.hide();
            element.show();
        }

        $(options.childSelector).each(function () {
            var child = $(this);
            var noInfoChildElement = $('#noInfo_' + child.attr('id'));

            noInfoChildElement.show();
            child.hide();
        });
    }

    var onChange = function (element) {
        element.bind('change', function () {
            var options = getOptions(element);
            //Iterate the childs
            $(options.childSelector).each(function () {
                var child = $(this);
                //Clear the child of its elements
                methods['clear'].call(child);

                if (element.val() != '') {
                    methods['load'].call(child, element.val());
                }
                else {
                    toggleNoInfoText(child, true);
                }
            });
        });
    }

    var methods = {
        init: function (options) {
            return this.each(function () {
                // setup private variables
                var $this = $(this);

                options = $.extend({}, $.fn.cascadeSelect.defaults, options);

                //Save the options
                $this.data('options', options);

                if (options.promptText) {
                    setPromptText($this);
                }

                if (options.noInfoText) {
                    setNoInfoText($this);
                }

                if (options.root) {
                    methods['load'].call($this);
                }
                else {
                    toggleNoInfoText($this, true);
                }

                if (options.childSelector != null) {
                    onChange($this);
                }
            });
        },
        clear: function () {
            var element = $(this);
            var options = getOptions(element);

            var onClearCallback = options.onClear;
            if (onClearCallback && $.isFunction(onClearCallback)) {
                onClearCallback.call(element);
            }
            else {
                if (options.noInfoText) {
                    var domElement = element.get(0);
                    for (var i = domElement.options.length - 1; i > 0; i--) {
                        domElement.remove(i);
                    }
                }
                else {
                    element.empty();
                }

                //Call clear on the childs as well
                $(options.childSelector).each(function () {
                    var child = $(this);
                    //Clear the child of its elements
                    methods['clear'].call(child);
                });
            }
        },
        load: function (data) {
            var element = $(this);
            var options = getOptions(element);

            var url = options.url;
            var filter = options.filter;
            var json = {};

            if (filter != null) {
                json[filter] = data;
            }

            data = data || null;

            var onLoadCallback = options.onLoad;
            if (onLoadCallback && $.isFunction(onLoadCallback)) {
                onLoadCallback.call(element, json);
            }
            else {
                $.ajax({
                    url: url,
                    type: 'GET',
                    data: json,
                    dataType: 'JSON',
                    success: function (data) {
                        // because $('#id') != document.getElementById('id')
                        var domElement = element.get(0);

                        //Emtpy the dropdown list
                        for (var i = domElement.options.length - 1; i > 0; i--) {
                            domElement.remove(i);
                        }

                        if (data.length > 0) {
                            for (var i = 0; i < data.length; i++) {
                                var item = data[i];
                                var option = new Option(item.Name, item.Id);
                                element.append(option);
                            }
                            toggleNoInfoText(element, false);
                        }
                        else {
                            toggleNoInfoText(element, true);
                        }
                    }
                });
            }
        }
    };

    $.fn.cascadeSelect = function (method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        }
        else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        }
        else {
            $.error('Method ' + method + ' does not exist on jQuery.cascadeSelect');
        }
    };

    $.fn.cascadeSelect.defaults = {
        root: false,
        url: null,
        childSelector: null,
        promptText: '[Please select an item]',
        noInfoText: 'No information available',
        filter: null,
        onLoad: null,
        onClear: null
    };
})(jQuery);
SUBTHEMES = src/vim-adwaita-light.jsonc src/vim-debug-light.jsonc src/vim-adwebug-light.jsonc
build : $(SUBTHEMES)
	(cd src; python3 build.py)

src/vim-adwaita-light.jsonc : src/vim-light.jsonc
	sed -e 's:Vim Light:Vim Adwaita Light:' < $< > $@

src/vim-debug-light.jsonc : src/vim-light.jsonc
	sed -e 's://":":' -e 's:Vim Light:Vim Debug Light:' < $< > $@

src/vim-adwebug-light.jsonc : src/vim-light.jsonc
	sed -e 's://":":' -e 's:Vim Light:Vim Adwebug Light:' < $< > $@

install : build
	cp themes/vim.json $$HOME/.var/app/dev.zed.Zed/config/zed/themes/vim.json

watch : install
	inotifywait -mqe close_write src/vim-*.json* src/themes/* | \
	while read; \
	do \
	    echo "> make install"; \
	    make install; \
	done

clean :
	$(RM) src/*.json $(SUBTHEMES)

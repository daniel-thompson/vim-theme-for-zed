SUBTHEMES = src/vim-adwaita-light.jsonc src/vim-adwaita-dark.jsonc
build : $(SUBTHEMES)
	(cd src; python3 build.py)

src/vim-adwaita-light.jsonc : src/vim-light.jsonc
	sed -e 's:Vim Light:Vim Adwaita Light:' < $< > $@

src/vim-adwaita-dark.jsonc : src/vim-dark.jsonc
	sed -e 's:Vim Dark:Vim Adwaita Dark:' \
	    -e 's:#282c33ff:#1e1e1eff:' \
		-e 's:#acb2beff:#ffffffff:' \
	< $< > $@

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

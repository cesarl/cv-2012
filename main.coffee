        child_tile = {
        x: 12,
        y: 1,
        w: 50,
        h: 110,
        startX: 0,
        startY: 0,
        partW: 12 * 50,
        partH: 110}

        cosmos_tile = {
        x: 12,
        y: 1,
        w: 50,
        h: 110,
        startX: 0,
        startY: 111,
        partW: 12 * 50,
        partH: 110}

        veto_tile = {
        x: 6,
        y: 2,
        w: 71,
        h: 101,
        startX: 0,
        startY: 222,
        partW: 6 * 71,
        partH: 101}

        smoke_tile = {
        x: 6,
        y: 1,
        w: 50,
        h: 110,
        startX: 0,
        startY: 111,
        partW: 6 * 50,
        partH: 110}

        spuf_tile = {
        x: 3,
        y: 2,
        w: 120,
        h: 120,
        startX: 0,
        startY: 0,
        partW: 3 * 120,
        partH: 2 * 120}

        butterfly_tile = {
        x: 5,
        y: 1,
        w: 22,
        h: 27,
        startX: 0,
        startY: 5 * 111,
        partW: 5 * 22,
        partH: 27}

        earth_tile = {
        w: 800,
        h: 138,
        imgW: 400,
        imgH: 138,
        startX: 0,
        startY: 0}

        moon_tile = {
        w: 800,
        h: 138,
        imgW: 340,
        imgH: 138,
        startX: 0,
        startY: 0}

        sky_tile = {
        w: 800,
        h: 500,
        imgW: 375,
        imgH: 319,
        startX: 0,
        startY: 138}

        big_tree_tile = {
        w: 800,
        h: 326,
        imgW: 400,
        imgH: 326,
        startX: 500,
        startY: 0}

        little_tree_tile = {
        w: 800,
        h: 149,
        imgW: 400,
        imgH: 149,
        startX: 500,
        startY: 370}

        cat_veto_tile = {
        w: 800,
        h: 149,
        imgW: 399,
        imgH: 149,
        startX: 501,
        startY: 370}

        chute_sky_tile = {
        w: 800,
        h: 600,
        imgW: 598,
        imgH: 389,
        startX: 0,
        startY: 0}

        chute_wall_tile = {
        w: 78,
        h: 600,
        imgW: 78,
        imgH: 145,
        startX: 598,
        startY: 0}

        chute_me_tile = {
        x: 7,
        y: 1,
        w: 111,
        h: 132,
        startX: 0,
        startY: 389,
        partW: 7 * 111,
        partH: 133}

        chute_bottle_tile = {
        x: 1,
        y: 1,
        w: 24,
        h: 74,
        startX: 0,
        startY: 521,
        partW: 24,
        partH: 74}

        chute_heart_tile = {
        x: 1,
        y: 1,
        w: 63,
        h: 74,
        startX: 25,
        startY: 521,
        partW: 63,
        partH: 74}

        chute_hippie_tile = {
        x: 1,
        y: 1,
        w: 64,
        h: 64,
        startX: 89,
        startY: 521,
        partW: 64,
        partH: 64}

        chute_anar_tile = {
        x: 1,
        y: 1,
        w: 73,
        h: 74,
        startX: 152,
        startY: 521,
        partW: 73,
        partH: 74}

        chute_coco_tile = {
        x: 1,
        y: 1,
        w: 70,
        h: 74,
        startX: 224,
        startY: 521,
        partW: 70,
        partH: 74}

        app = new App()
        app.event = new Event()
        app.startCycle(true)
        app.fullScreenOn()
        app.canvas = new Canvas app, "canvas", 800, 600


        childhood = () ->
                @
        childhood.start = () ->
                @earth = new Node()
                @earth.addSquare 0, 0, 0, 500
                @earth.addTexture earth_tile, app.decor
                @earth.animateTexture 5, 0, 1, -1

                @sky = new Node()
                @sky.addSquare 0, 0, 0, 0
                @sky.addTexture sky_tile, app.decor
                @sky.animateTexture 2, 0, 1, -1

                @btree = new Node()
                @btree.addSquare 0, 0, 0, 175
                @btree.addTexture big_tree_tile, app.decor
                @btree.animateTexture 3, 0, 1, -1

                @ltree = new Node()
                @ltree.addSquare 0, 0, 0, 353
                @ltree.addTexture little_tree_tile, app.decor
                @ltree.animateTexture 4, 0, 1, -1

                @sky.drawTexture null, null, app.canvas
                @btree.drawTexture null, null, app.canvas
                @ltree.drawTexture null, null, app.canvas
                @earth.drawTexture null, null, app.canvas


                @col = new Collection()
                @col._spawn = @col.addCycle 100, -1, =>
                        node = new Node()
                        node.addSquare 22, 27, 800, 250 + Math.floor(Math.random() * 250)
                        node.addTile butterfly_tile, app.img
                        node.animateTile 0, 1, false, 4, -1
                        node.drawTile null, null, app.canvas
                        @col.add(node)
        childhood.childArrive = () ->
                @child = new Node()
                @child.addSquare 50, 50, -10, -110
                @child.addTile child_tile, app.img
                @child.animateTile 0, 6, false, 4, -1
                @child.slideTo 100, 450, 20, =>
                        @child._jumpYGravity = 1
                        @child._jump = pubsub.subscribe("up",
                                => @child.animateTile(7, 11, true, 4, -1)
                                .jumpY(-20, @child._jumpYGravity, =>
                                        @child.animateTile 0, 6, false, 4, -1
                                )
                        )
                @child.drawTile null, null, app.canvas
                @col._move = @col.addCycle 1, -1, =>
                        @col.each (elem) =>
                                elem.move -2, 0
                                if elem.square.xx <= 0
                                        elem.killTile()
                        if @child then @col.squareCollision(@child.square, (elem) =>
                                elem.killTile()
                        )
        childhood.cosmos = () ->
                app.canvas.clearEachFrame()
                @btree.slideTo 800, 800, 30
                @ltree.slideTo 0, -500, 30
                @earth.slideTo 0, 800, 30
                @sky.slideTo 0, -800, 35, =>
                        @sky.addTexture sky_tile, app.decorSpace
                        @btree.addTexture big_tree_tile, app.decorSpace
                        @ltree.addTexture little_tree_tile, app.decorSpace
                        @ltree.animateTexture 4, 0, 1, -1
                        @sky.animateTexture 2, 0, 1, -1
                        @btree.animateTexture 3, 0, 1, -1
                        @earth.addTexture moon_tile, app.decorSpace
                        @earth.animateTexture 5, 0, 1, -1
                        @sky.slideTo 0, 0, 40, =>
                                @earth.slideTo 0, 500, 40, =>
                                        @btree.slideTo 0, 175, 40, =>
                                                @ltree.slideTo 0, 353, 40, =>
                                                        @spuf = new Node()
                                                        @spuf.addSquare 120, 120, 120, 120
                                                        @spuf.addTile spuf_tile, app.spuf
                                                        @spuf.drawTile null, null, app.canvas
                                                        @spuf.follow @child, 0, 20
                                                        @spuf.animateTile 0, 5, true, 2, 6, (=> @spuf.kill())
                                                        @child.addTile cosmos_tile, app.img
                                                        @child._jumpYGravity = 0.5
                                                        @col.killCycle @col._move
                                                        @col.killCycle @col._spawn
                                                        @col.killAll()
        childhood.veto = () ->
                @btree.slideTo 800, 800, 30
                @ltree.slideTo 0, -500, 30
                @earth.slideTo 0, 800, 30
                @sky.slideTo 0, -800, 35, =>
                        @sky.addTexture sky_tile, app.decorVeto
                        @btree.addTexture big_tree_tile, app.decorVeto
                        @ltree.addTexture cat_veto_tile, app.decorVeto
                        @ltree.animateTexture 4, 0, 1, -1
                        @sky.animateTexture 2, 0, 1, -1
                        @btree.animateTexture 3, 0, 1, -1
                        @earth.addTexture earth_tile, app.decorVeto
                        @earth.animateTexture 5, 0, 1, -1
                        @sky.slideTo 0, 0, 40, =>
                                @earth.slideTo 0, 500, 40, =>
                                        @btree.slideTo 0, 175, 40, =>
                                                @ltree.slideTo 0, 50, 40, =>
                                                        @spuf = new Node()
                                                        @spuf.addSquare 120, 120, 120, 120
                                                        @spuf.addTile spuf_tile, app.spuf
                                                        @spuf.drawTile null, null, app.canvas
                                                        @spuf.follow @child, 2, 0, 20
                                                        @spuf.animateTile 0, 5, true, 2, 6, => @spuf.kill()
                                                        @child.addTile veto_tile, app.img
                                                        @child._jumpYGravity = 1
                                                        app.canvas.stopClearEachFrame()
        childhood.childBack = () ->
                @spuf = new Node()
                @spuf.addSquare 120, 120, 120, 120
                @spuf.addTile spuf_tile, app.spuf
                @spuf.drawTile null, null, app.canvas
                @spuf.follow @child, 2, 0, 20
                @spuf.animateTile 0, 5, true, 2, 6, => @spuf.kill()
                @child.addTile child_tile, app.img
        childhood.earthquake = () ->
                @sky.stopAnimateTexture()
                @btree.stopAnimateTexture()
                @ltree.stopAnimateTexture()
                @earth.stopAnimateTexture()
                pubsub.unsubscribe(@child._jump)
                @sky.shake(4, 30)
                @earth.shake(5, 30)
                @ltree.shake(10, 30)
                @btree.shake(10, 30)
                @child.slideTo 400, 450, 50, =>
                        @child.addTile child_tile, app.img
                        @child.animateTile 4, 4, false, 4, 1
                        @child.stopAnimateTile()
                        @child.shake(5, 30)
        childhood.stop = () ->
                @sky.killAll();
                @btree.killAll();
                @ltree.killAll();
                @earth.killAll();
                @child.killAll();

        chute = () ->
                @
        chute.start = () ->
                @sky = new Node()
                @sky.addSquare 0, 0, 0, 0
                @sky.addTexture chute_sky_tile, app.decorChute
                @sky.animateTexture 0, 9, 1, -1
                @sky.drawTexture null, null, app.canvas
                @leftWall = new Node()
                @leftWall.addSquare 0, 0, 0, 0
                @leftWall.addTexture chute_wall_tile, app.decorChute
                @leftWall.animateTexture 0, 12, 1, -1
                @leftWall.drawTexture null, null, app.canvas
                @rightWall = new Node()
                @rightWall.addSquare 0, 0, 800 - 78, 0
                @rightWall.addTexture chute_wall_tile, app.decorChute
                @rightWall.animateTexture 0, 12, 1, -1
                @rightWall.drawTexture null, null, app.canvas

                @me = new Node()
                @me.addSquare 111, 132, 300, -140
                @me.addTile chute_me_tile, app.decorChute
                @me.animateTile 0, 5, true, 4, -1
                @me.slideTo 300, 300, 40, =>
                        @me.square.startFreeMove(app.event, -2, 2, 2, -2, 0, 800 - 78, 600, 78)
                @me.drawTile null, null, app.canvas
        chute.love = () ->
                @col = new Collection()

                @col._addNode = () ->
                        node = new Node()
                        node.addSquare 67, 74, 78 + Math.floor(Math.random() * 600), 650
                        node.addTile chute_heart_tile, app.decorChute
                        node.drawTile null, null, app.canvas
                        node
                @col._spawn = @col.addCycle 30, -1, =>
                        node = @col._addNode()
                        @col.add(node)
                @col._move = @col.addCycle 1, -1, =>
                        @col.each (elem) =>
                                elem.move 0, -3
                                if elem.square.yy <= 0
                                        elem.killTile()
                        if @me then @col.squareCollision(@me.square, (elem) =>
                                elem.killTile()
                        )
        chute.beer = () ->
                @col._addNode = () ->
                        node = new Node()
                        node.addSquare 24, 74, 78 + Math.floor(Math.random() * 600), 650
                        node.addTile chute_bottle_tile, app.decorChute
                        node.drawTile null, null, app.canvas
                        node
        chute.hippie = () ->
                @col._addNode = () ->
                        node = new Node()
                        node.addSquare 64, 64, 78 + Math.floor(Math.random() * 600), 650
                        node.addTile chute_hippie_tile, app.decorChute
                        node.drawTile null, null, app.canvas
                        node
        chute.anar = () ->
                @col._addNode = () ->
                        node = new Node()
                        node.addSquare 73, 74, 78 + Math.floor(Math.random() * 600), 650
                        node.addTile chute_anar_tile, app.decorChute
                        node.drawTile null, null, app.canvas
                        node
        chute.coco = () ->
                @col._addNode = () ->
                        node = new Node()
                        node.addSquare 73, 74, 78 + Math.floor(Math.random() * 600), 650
                        node.addTile chute_coco_tile, app.decorChute
                        node.drawTile null, null, app.canvas
                        node
        chute.stopCol = () ->
                @col.killCycle @col._move
                @col.killCycle @col._spawn
                @col.killAll()
        chute.end = () ->
                @sky.killAll()
                @leftWall.killAll()
                @rightWall.killAll()
                @me.killAll()

        end = () ->
                app.canvas.stopClearEachFrame()
                chute.end()
                app.stopCycle()
        text = [{
                exec: => childhood.start(),
                print: true,
                sleep: 250,
                tmpSleep: 25,
                txt: "CV César LEBLIC\n2012",
                x: 400,
                y: 300,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "60"
                },
                {
                exec: => childhood.childArrive(),
                print: false,
                sleep: 100,
                tmpSleep: 10,
                },
                {
                exec: false,
                print: true,
                sleep: 200,
                tmpSleep: 20,
                txt: "Mon enfance fût tranquille",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 200,
                tmpSleep: 20,
                txt: "comme tout les enfants,\n je revais à de bien beaux métiers.",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => childhood.cosmos(),
                print: true,
                sleep: 400,
                tmpSleep: 40,
                txt: "J'ai voulu être cosmonaute",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 150,
                tmpSleep: 15,
                txt: "ainsi que...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => childhood.veto(),
                print: true,
                sleep: 400,
                tmpSleep: 40,
                txt: "vétérinaire",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => childhood.childBack(),
                print: false,
                sleep: 150,
                tmpSleep: 40,
                txt: "",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 400,
                tmpSleep: 40,
                txt: "puis\nalors que je ne m'y attendais pas\narriva...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                        },
                {
                exec: => childhood.earthquake(),
                print: true,
                sleep: 210,
                tmpSleep: 400,
                txt: "L'ADOLESCENCE",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "70"
                },
                {
                exec: =>
                        childhood.stop()
                        chute.start()
                ,
                print: true,
                sleep: 120,
                tmpSleep: 400,
                txt: "L'ADOLESCENCE",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "70"
                },
                {
                exec: false
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "Je fais ma scolarité au collège Condorcet\npuis au lycée Racine",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "Je participe à la création de Prométhée:\nqui reçoit le prix\ndu meilleur journal lycéen\nen 2005",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false
                print: true,
                sleep: 160,
                tmpSleep: 400,
                txt: "A part ça\nrien de très interessant à raconter...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.love(),
                print: true,
                sleep: 300,
                tmpSleep: 400,
                txt: "J'y ai découvert l'amour ...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.beer(),
                print: true,
                sleep: 300,
                tmpSleep: 400,
                txt: "la bière ...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "J'ai été pas mal de chose...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.hippie(),
                print: true,
                sleep: 220,
                tmpSleep: 400,
                txt: "un jour hippie...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.anar(),
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "un autre anarchiste...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.coco(),
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "un autre communiste...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => chute.stopCol(),
                print: true,
                sleep: 80,
                tmpSleep: 400,
                txt: "BREF",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "70"
                },
                {
                exec: false,
                print: true,
                sleep: 180,
                tmpSleep: 400,
                txt: "C'était l'adolescence",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 110,
                tmpSleep: 400,
                txt: "Puis arriva...",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 110,
                tmpSleep: 400,
                txt: "FIN !!!\n:D",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "70"
                },
                {
                exec: false,
                print: true,
                sleep: 330,
                tmpSleep: 400,
                txt: "Je m'arrête là pour le moment,\ncar mine de rien\n ca prend du temps de dessiner\nces petites sprites\naussi moches soient-elles héhé",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: false,
                print: true,
                sleep: 110,
                tmpSleep: 400,
                txt: "Suite prochainement",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                },
                {
                exec: => end(),
                print: false,
                sleep: 110,
                tmpSleep: 400,
                txt: "",
                x: 400,
                y: 80,
                bgColor: "#fff",
                txtColor: "#000",
                fontFamily: "Changa One",
                fontSize: "40"
                }
        ]

        app.loadImages [{name: "img", src: "img/child.png"},
                {name: "decor", src: "img/decor-child.png"},
                {name: "spuf", src: "img/spuf.png"},
                {name: "decorSpace", src: "img/decor-space.png"},
                {name: "decorVeto", src: "img/decor-veto.png"},
                {name: "decorChute", src: "img/decor-chute.png"}], =>
                        reader = new Reader text, app.canvas
                        reader.read()
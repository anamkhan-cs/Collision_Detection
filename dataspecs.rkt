;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname dataspecs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

; A People-World is
; (make-pw [List-of Posn] Direction [List-of Posn] Type Natural Natural Natural)
; interp: if 'a-pw' is a People-World then all of:
; - (pw-helicopter a-pw) is the direction that the helicopter will be moving
;    when dropping the people
; - (pw-canon a-pw) is the direction vector of the coordinate
; - (pw-people a-pw) is a list of the positions of the people falling
; - (pw-score a-pw) is the score
; - (pw-count a-pw) is the number of people that have fallen beyond reach, game
;    over when the number is 3, resets to 0 when a new level is reached
; - (pw-level a-pw) is the current level that the player is on
(define-struct pw (helicopter canon people score count level))

; A People is (make-people Posn Type)
; interp: if 'a-people' is a People then all of:
; - (people-posn a-people) is a Posn,
; - (people-type a-people) is a Type

; A Type is one of:
; - "regular"
; - "special"
; - "bomb"
(define-struct people (posn type))

; A Helicopter is (make-helicopter Posn Direction)
; interp: if 'a-helicopter' is a Helicopter then all of:
; - (helicopter-posn a-helicopter) is a Posn,
; - (helicopter-direction a-helicopter) is a Direction

; A Direction is one of:
; - "left"
; - "right"
(define-struct helicopter (posn direction))

; A LoR is one of:
; - "right"
; - "left"

; A Direction is a (make-dir Real Real Real)
(define-struct dir [dx dy dz])

; A Posn is (make-posn Real Real)

(define WORLD-WIDTH 400)
(define WORLD-HEIGHT 400)
(define MAX-PEOPLE 30)
(define INV-P-PEOPLE 25)
(define BACKGROUND (empty-scene WORLD-WIDTH WORLD-HEIGHT))

(define PEOPLE-IMAGE (triangle 10 "solid" "black"))
(define HELICOPTER-LENGTH 20)
(define HELICOPTER-HEIGHT 12)
(define HELICOP-IMAGE (rectangle PADDLE-LENGTH PADDLE-HEIGHT "solid" "black"))

(define PW1 (make-pw (make-helicopter 0 "left") (make-dir 0 0 0) 

; tick : People-world -> People-world
; to get a new People-world on every tick
(define (tick a-pw))

; draw-level : People-world -> People-world
; returns a new People-world if based on which level the player is 
(define (draw-level a-pw))

; update-people : People-world -> List-of-Posn
; updates the falling people's y coordinate by 1
(define (update-people a-pw))

; check-count : People-world -> Natural
; updates the number of people who are out of reach
(define (check-count a-pw))

; collision-detection : [List-of Posn] Direction -> Boolean
; returns true or false based on whether collision occurs or not between people
; and missile
(define (collision-detection people canon))

; remove : [List-of Posn] -> People-world
; checks whether collision has occured, removes if true, allows it to fall down
; and increments count if false
(define (remove people))

; check-type : Type -> Natural
; updates the score of the game based on the type of people targeted
(define (check-type kind))

; update-score : People-world -> Natural
; gets the new score
(define (update-score a-pw))

; draw : People-world -> Scene
; renders the people, canon and score as a scene
(define (draw a-pw))

; key : People-world Key-event -> People-world
; returns a different People-world based on the following key events
; - on key-event " " (space bar) launches the missile at the people
; - on key-event left arrow moves the canon ray direction to the left
; - on key-event right arrow moves the canon ray direction to the right
(define (key a-pw a-key))
  
; start : Any -> People-world
; starts the targeting game
(define (start _dummy)
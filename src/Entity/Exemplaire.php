<?php

namespace App\Entity;

use App\Repository\ExemplaireRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ExemplaireRepository::class)]
class Exemplaire
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Usure $usure = null;

    #[ORM\ManyToOne(inversedBy: 'exemplaires')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Stock $stock = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Livre $livre = null;

    public function __toString()
    {
        return $this->getId()." - ".$this->getLivre();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsure(): ?Usure
    {
        return $this->usure;
    }

    public function setUsure(?Usure $usure): self
    {
        $this->usure = $usure;

        return $this;
    }

    public function getStock(): ?Stock
    {
        return $this->stock;
    }

    public function setStock(?Stock $stock): self
    {
        $this->stock = $stock;

        return $this;
    }

    public function getLivre(): ?Livre
    {
        return $this->livre;
    }

    public function setLivre(?Livre $livre): self
    {
        $this->livre = $livre;

        return $this;
    }
}
